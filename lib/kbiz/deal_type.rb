module Kbiz
  class DealType
    include Kbiz.initializer(:name, :roles)

    def initialize(*)
      super
      raise ArgumentError if @name.nil? || @name == ''
    end

    def add_role(role, stake)
      self.class.new(name, roles.merge(role => stake))
    end

    attr :roles

    def role_count
      roles.size
    end

    def total_stake_assigned
      roles.values.inject(Stake.new(0), :+)
    end

    def stake_left_to_assign
      Stake.new(10000) - total_stake_assigned
    end

    def complete?
      stake_left_to_assign == Stake.new(0)
    end
  end
end
