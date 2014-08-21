module ActiveRecordFilterLoadedRelations
  module Nodes
    class NotMatches < Matches
      def apply
        @records.select do |r|
          !(to_regexp(right_value(r)) =~ left_value(r))
        end
      end
    end
  end
end