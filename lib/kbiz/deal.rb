module Kbiz
  class Deal
    include Kbiz.initializer(:name, :identifier, :revenue, :deal_type, :assignments)

    def initialize(*)
      super
      raise ArgumentError if @name.nil? || @name == ''
      raise ArgumentError if @identifier.nil? || @identifier == ''
    end
    attr :assignments, :revenue

    def assignment_count
      @assignments.size
    end

    def assign(team_member, role)
      self.class.new(name, identifier, revenue, deal_type, assignments.merge(role => Assignment.new(team_member)))
    end

    def with_new_deal_type(new_deal_type)
      self.class.new(name, identifier, revenue, new_deal_type, Hash[new_deal_type.roles.map { |role, stake| [role, VacantAssignment.new] }])
    end

    def assignment_for(role)
      assignments[role]
    end
  end
end
