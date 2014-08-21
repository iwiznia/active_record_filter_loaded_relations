module ActiveRecordFilterLoadedRelations
  module Nodes
    class Grouping < Node
      def apply
        Nodes.const_get(@arel_node.expr.class.name.demodulize).new(@records, @arel_node.expr, @bind_values).apply
      end
    end
  end
end