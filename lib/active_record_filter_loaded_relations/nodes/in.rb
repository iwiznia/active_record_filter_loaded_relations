module ActiveRecordFilterLoadedRelations
  module Nodes
    class In < Node
      def apply
        @records.select do |r|
          ([*left_value(r)] & [*right_value(r)]).present?
        end
      end
    end
  end
end