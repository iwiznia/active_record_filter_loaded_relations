module ActiveRecordFilterLoadedRelations
  class Filter
    SUPPORTED_NODES = [:Equality, :In, :NotEqual, :Grouping, :Or, :And, :GreaterThan, :GreaterThanOrEqual, :LessThan, :LessThanOrEqual, :Matches, :DoesNotMatch]

    def initialize(relation)
      @relation = relation
    end

    def method_missing(method, *args, &block)
      scope = @relation.send(method, *args, &block)
      if @relation.loaded? && is_valid_scope?(scope)
        apply_scope(scope)
      else
        scope
      end
    end

    private

    def is_valid_scope?(scope)
      (ActiveRecord::Relation::MULTI_VALUE_METHODS - [:where, :bind]).all? {|m| scope.send("#{m}_values").blank? } &&
        scope.where_values.all? {|node| is_valid_node?(node) }
    end

    def is_valid_node?(node)
      !node.is_a?(Arel::Nodes::Node) ||
        (SUPPORTED_NODES.include?(node.class.name.demodulize.to_sym) &&
          (!node.respond_to?(:expr) || is_valid_node?(node.expr)) &&
          (!node.respond_to?(:left) || is_valid_node?(node.left)) &&
          (!node.respond_to?(:right) || is_valid_node?(node.right)))
    end

    def apply_scope(scope)
      records = @relation
      scope.where_values.each do |node|
        records = Nodes.const_get(node.class.name.demodulize).new(records, node, scope.bind_values).apply
      end
      records
    end
  end
end
