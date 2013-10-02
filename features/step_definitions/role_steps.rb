When(/^I create a role with a title and job description$/) do
  @role = Kbiz::Role.new("Course co-ordinator", "This is what you need to do!")
end

Then(/^the role is created$/) do
  expect(@role).not_to be_nil
end

When(/^I create a role without a title$/) do
  @role = Kbiz::Role.new("", "This is what you need to do!") rescue nil
end

Then(/^the role isn't created$/) do
  expect(@role).to be_nil
end

When(/^I create a role without a job description$/) do
  @role = Kbiz::Role.new("Course co-ordinator", "") rescue nil
end
