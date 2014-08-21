require 'active_record_filter_loaded_relations/version'

require 'active_record_filter_loaded_relations/nodes/node'
require 'active_record_filter_loaded_relations/nodes/and'
require 'active_record_filter_loaded_relations/nodes/or'
require 'active_record_filter_loaded_relations/nodes/equality'
require 'active_record_filter_loaded_relations/nodes/not_equal'
require 'active_record_filter_loaded_relations/nodes/in'
require 'active_record_filter_loaded_relations/nodes/greater_than'
require 'active_record_filter_loaded_relations/nodes/greater_than_or_equal'
require 'active_record_filter_loaded_relations/nodes/less_than'
require 'active_record_filter_loaded_relations/nodes/less_than_or_equal'
require 'active_record_filter_loaded_relations/nodes/grouping'
require 'active_record_filter_loaded_relations/nodes/matches'
require 'active_record_filter_loaded_relations/nodes/not_matches'
require 'active_record_filter_loaded_relations/filter'

module ActiveRecordFilterLoadedRelations
end

class ActiveRecord::Relation
  def filter_loaded
    ActiveRecordFilterLoadedRelations::Filter.new(self)
  end
end