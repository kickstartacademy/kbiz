When(/^I create a deal with a name and tracking identifier$/) do
  @deal = Kbiz::Deal.new("BDD Kickstart London 2013", "K-202-LON-PC")
end

Then(/^the deal is created$/) do
  expect(@deal).not_to be_nil
end

When(/^I create a deal without a name$/) do
  @deal = Kbiz::Deal.new(nil, "K-202-LON-PC") rescue nil
end

Then(/^I get an error$/) do
  expect(@deal).to be_nil
end

Then(/^the deal isn't created$/) do
end

When(/^I create a deal without a tracking identifier$/) do
  @deal = Kbiz::Deal.new("BDD Kickstart London 2013", "") rescue nil
end
