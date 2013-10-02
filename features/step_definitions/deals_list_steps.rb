Given(/^there are several deals currently active$/) do
  @deals = Kbiz::DealsList.new [
    Kbiz::Deal.new("BDD Kickstart London 2013", "K-202-LON-PC", Kbiz::MoneyNotSpecified.new, nil, {}).with_new_deal_type(deal_type),
    Kbiz::Deal.new("CD Kickstart May 2014", "K-203-LON-PB", Kbiz::Money.new(4000), nil, {}).with_new_deal_type(deal_type),
    Kbiz::Deal.new("CD Kickstart Jun 2014", "K-205-LON-PB", Kbiz::Money.new(500), nil, {}).with_new_deal_type(deal_type)
  ]
end

Then(/^I should be able to see them in a list$/) do
  expect(@deals).not_to be_nil
end

Then(/^I should see a total revenue report$/) do
  expect(@deals.revenue).to eq(Kbiz::Money.new(4500))
end
