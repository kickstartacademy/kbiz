Given(/^a deal worth .(\d+)$/) do |revenue|
  @deal = Kbiz::Deal.new("name", "id", Kbiz::Money.new(revenue.to_i * 100), deal_type, {})
end

Given(/^"(.*?)" has a role worth (\d+)% and one worth (\d+)%$/) do |name, stake1, stake2|
  role1 = Kbiz::Role.new("role1", "description")
  role2 = Kbiz::Role.new("role2", "description")
  @deal = @deal.with_new_deal_type(@deal_type.
    add_role(role1, stake_from_percentage(stake1)).
    add_role(role2, stake_from_percentage(stake2)))
  @team_member = Kbiz::TeamMember.new(name)
  @deal = @deal.assign(@team_member, role1).assign(@team_member, role2)
end

Then(/^his earning report for that deal should show his earnings as .(\d+)$/) do |earnings|
  Kbiz::EarningReporter.new(@deal).report_for(@team_member).should == Kbiz::Money.new(earnings.to_i * 100)
end
