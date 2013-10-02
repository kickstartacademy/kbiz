def new_deal_type
  @deal_type = Kbiz::DealType.new("Public course", {})
end

def stake_from_percentage(percentage)
  Kbiz::Stake.new(percentage.to_i * 100)
end

def add_a_role(stake)
  role = Kbiz::Role.new("Co-ordinator", "basic description of role")
  @deal_type = @deal_type.add_role(role, stake)
end

When(/^I create a deal type with a name$/) do
  new_deal_type
end

Then(/^the deal type is created$/) do
  expect(@deal_type).not_to be_nil
end

Given(/^I have a deal type$/) do
  new_deal_type
end

When(/^I add a(?:nother)? role with a (\d+)% stake$/) do |stake_percentage|
  add_a_role(stake_from_percentage(stake_percentage))
end

Then(/^the stake should be listed$/) do
end

Then(/^the stake list is incomplete with (\d+)% left to assign$/) do |left|
  expect(@deal_type).not_to be_complete
  expect(@deal_type.stake_left_to_assign).to eq(stake_from_percentage(left))
end

Then(/^the stake list is complete as the stakes now total (\d+)%$/) do |total|
  expect(@deal_type).to be_complete
  expect(@deal_type.total_stake_assigned).to eq(stake_from_percentage(total))
end

When(/^I add a wages role$/) do
  add_a_role(Kbiz::WagesInsteadOfStake.new)
end
