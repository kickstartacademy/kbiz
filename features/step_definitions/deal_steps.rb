def role
  @role ||= Kbiz::Role.new("Co-ordinator", "basic description of role")
end

def deal_type
  @deal_type ||= Kbiz::DealType.new("Public course", {}).add_role(role, Kbiz::Stake.new(5000))
end

When(/^I create a deal with a name, tracking identifier, a revenue amount and a type$/) do
  @deal = Kbiz::Deal.new("BDD Kickstart London 2013", "K-202-LON-PC", Kbiz::Money.new(5000), deal_type)
end

Then(/^the deal is created$/) do
  expect(@deal).not_to be_nil
end

Then(/^the roles from the deal type are copied in as vacant assignments$/) do
  expect(@deal.assignment_count).to eq(deal_type.role_count)
  expect(@deal.assignments).to eq([Kbiz::VacantAssignment.new(role)])
end

When(/^I create a deal without a name$/) do
  @deal = Kbiz::Deal.new(nil, "K-202-LON-PC", Kbiz::Money.new(2300)) rescue nil
end

Then(/^I get an error$/) do
end

Then(/^the deal isn't created$/) do
  expect(@deal).to be_nil
end

When(/^I create a deal without a tracking identifier$/) do
  @deal = Kbiz::Deal.new("BDD Kickstart London 2013", "", Kbiz::Money.new(4000), deal_type) rescue nil
end

When(/^I create a deal without revenue specified$/) do
  @deal = Kbiz::Deal.new("BDD Kickstart London 2013", "K-202-LON-PC", Kbiz::MoneyNotSpecified.new, deal_type)
end

Then(/^the revenue shows as unspecified$/) do
  expect(@deal.revenue).to eq(Kbiz::MoneyNotSpecified.new)
end
