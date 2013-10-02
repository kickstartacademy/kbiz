$: << "lib"

require 'sinatra'
require 'capybara/cucumber'

require 'kbiz'

Capybara.app = Kbiz.app

def role
  @role ||= Kbiz::Role.new("Co-ordinator", "basic description of role")
end

def deal_type
  @deal_type ||= Kbiz::DealType.new("Public course", {}).add_role(role, Kbiz::Stake.new(5000))
end

def stake_from_percentage(percentage)
  Kbiz::Stake.new(percentage.to_i * 100)
end
