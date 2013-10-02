module Kbiz
  class VacantAssignment
    def ==(other)
      other.kind_of?(VacantAssignment)
    end
  end

  class Assignment
    include Kbiz.initializer(:team_member)
    attr :team_member

    def ==(other)
      other.team_member == @team_member
    end
  end
end
