module Kbiz
  class Deal
    include Kbiz.initializer(:name, :identifier, :revenue, :deal_type)

    def initialize(*)
      super
      raise ArgumentError if @name.nil? || @name == ''
      raise ArgumentError if @identifier.nil? || @identifier == ''
      @assignments = deal_type.roles.map { |role, stake| VacantAssignment.new(role) }
    end

    attr :assignments

    def revenue
      @revenue
    end

    def assignment_count
      @assignments.size
    end
  end
end
