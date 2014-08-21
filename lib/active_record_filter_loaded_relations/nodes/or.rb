module ActiveRecordFilterLoadedRelations
  module Nodes
    class Or < Node
      def apply
        (Nodes.const_get(@arel_node.left.class.name.demodulize).new(@records, @arel_node.left, @bind_values).apply +
            Nodes.const_get(@arel_node.right.class.name.demodulize).new(@records, @arel_node.right, @bind_values).apply).uniq
      end
    end
  end
end