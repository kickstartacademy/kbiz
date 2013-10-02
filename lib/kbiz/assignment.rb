module Kbiz
  class VacantAssignment
    include Kbiz.initializer(:role)

    attr :role

    def ==(other)
      @role == other.role
    end
  end
end
