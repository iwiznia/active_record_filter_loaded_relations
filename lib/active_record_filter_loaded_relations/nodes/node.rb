module ActiveRecordFilterLoadedRelations
  module Nodes
    class Node
      def initialize(records, arel_node, bind_values)
        @records = records
        @arel_node = arel_node
        @bind_values = bind_values
      end

      def apply
        @records
      end

      def left_value(record)
        get_arel_attribute_value(@arel_node.left, record, @arel_node.right)
      end

      def right_value(record)
        get_arel_attribute_value(@arel_node.right, record, @arel_node.left)
      end

      def get_arel_attribute_value(attribute, object, other)
        if attribute.is_a?(Arel::Attributes::Attribute)
          object.send(attribute.name)
        elsif attribute.is_a?(Arel::Nodes::BindParam)
          @bind_values.find {|v| v[0].name == other.name}[1]
        else
          attribute
        end
      end
    end
  end
end
