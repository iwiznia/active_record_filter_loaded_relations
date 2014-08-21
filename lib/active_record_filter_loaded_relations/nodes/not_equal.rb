module ActiveRecordFilterLoadedRelations
  module Nodes
    class NotEqual < Node
      def apply
        @records.select do |r|
          left_value(r) != right_value(r)
        end
      end
    end
  end
end