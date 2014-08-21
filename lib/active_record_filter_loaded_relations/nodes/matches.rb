module ActiveRecordFilterLoadedRelations
  module Nodes
    class Matches < Node
      def apply
        @records.select do |r|
          to_regexp(right_value(r)) =~ left_value(r)
        end
      end

      private
      def to_regexp(v)
        Regexp.new(v.gsub('%', '.*').gsub('_', '.'))
      end
    end
  end
end