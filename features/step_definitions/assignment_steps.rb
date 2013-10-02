Given(/^a deal type with a vacancy$/) do
  @deal = Kbiz::Deal.new("BDD Kickstart London 2013", "K-202-LON-PC", Kbiz::MoneyNotSpecified.new, nil, {}).with_new_deal_type(deal_type)
end

When(/^I assign a team member to it$/) do
  @team_member = Kbiz::TeamMember.new("chrismdp")
  @deal = @deal.assign(@team_member, role)
end

Then(/^the vacancy is filled$/) do
  expect(@deal.assignment_for(role)).to eq(Kbiz::Assignment.new(@team_member))
end

Given(/^a deal type with a assigned role$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I change the team member assigned to it$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the role is updated$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I remove the team member from the role$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the role is vacant$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I change the deal type for the deal$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^all the roles are vacant again$/) do
  pending # express the regexp above with the code you wish you had
end
