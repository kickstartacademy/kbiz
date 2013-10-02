module Kbiz
  class EarningReporter
    include Kbiz.initializer(:deal)

    def report_for(team_member)
      roles = @deal.roles_assigned_to(team_member)
      total_stake = @deal.deal_type.total_stake_for_roles(roles)
      total_stake.slice_of(@deal.revenue)
    end
  end
end
