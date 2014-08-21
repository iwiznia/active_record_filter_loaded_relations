module ActiveRecordFilterLoadedRelations
  module Nodes
    class LessThan < Node
      def apply
        @records.select do |r|
          left_value(r) < right_value(r)
        end
      end
    end
  end
end

class LessThanOrEqual < Node
  def apply
    @records.select do |r|
      left_value(r) <= right_value(r)
    end
  end
end

class Matches < Node
  def apply
    @records.select do |r|
      to_regexp(right_value(r)) =~ left_value(r)
    end
  end

  def to_regexp(v)
    Regexp.new(v.gsub('%', '.*').gsub('_', '.'))
  end
end
