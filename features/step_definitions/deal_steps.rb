When(/^I create a deal with a name and tracking identifier$/) do
  visit "/deals"
  click_on "Create new deal"
  fill_in "Name", :with => "BDD Kickstart London 2013"
  fill_in "Tracking identifier", :with => "K-PC-LON-102"
  click_on "Create deal"
end

Then(/^the deal is created$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I create a deal without a name$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I see an error$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the deal isn't created$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I create a deal without a tracking identifier$/) do
  pending # express the regexp above with the code you wish you had
end
