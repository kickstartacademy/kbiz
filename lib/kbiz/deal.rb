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

    def remove_assignation(role)
      self.class.new(name, identifier, revenue, deal_type, assignments.merge(role => VacantAssignment.new))
    end

    def with_new_deal_type(new_deal_type)
      self.class.new(name, identifier, revenue, new_deal_type, all_vacant_assignments(new_deal_type.roles))
    end

    def assignment_for(role)
      assignments[role]
    end

    private

    def all_vacant_assignments(roles)
      Hash[roles.map { |role, stake| [role, VacantAssignment.new] }]
    end

  end
end
