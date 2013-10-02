def deal_with_deal_type
  @deal ||= Kbiz::Deal.new("BDD Kickstart London 2013", "K-202-LON-PC", Kbiz::MoneyNotSpecified.new, nil, {}).with_new_deal_type(deal_type)
end

Given(/^a deal type with a vacancy$/) do
  deal_with_deal_type
end

When(/^I assign a team member to it$/) do
  @team_member = Kbiz::TeamMember.new("chrismdp")
  @deal = @deal.assign(@team_member, role)
end

Then(/^the vacancy is filled$/) do
  expect(@deal.assignment_for(role)).to eq(Kbiz::Assignment.new(@team_member))
end

Given(/^a deal type with a assigned role$/) do
  @team_member = Kbiz::TeamMember.new("chrismdp")
  @deal = deal_with_deal_type.assign(@team_member, role)
end

When(/^I change the team member assigned to it$/) do
  @another_team_member = Kbiz::TeamMember.new("mattwynne")
  @deal = deal_with_deal_type.assign(@another_team_member, role)
end

Then(/^the role is updated$/) do
  expect(@deal.assignment_for(role)).to eq(Kbiz::Assignment.new(@another_team_member))
end

When(/^I remove the team member from the role$/) do
  @deal = deal_with_deal_type.remove_assignation(role)
end

Then(/^the role is vacant$/) do
  expect(@deal.assignment_for(role)).to eq(Kbiz::VacantAssignment.new)
end

When(/^I change the deal type for the deal$/) do
  @new_deal_type = Kbiz::DealType.new("New type of deal", {})
  @deal = deal_with_deal_type.with_new_deal_type(@new_deal_type)
end

Then(/^all the roles are vacant again$/) do
  expect(@deal.assignments).to eq({})
end
