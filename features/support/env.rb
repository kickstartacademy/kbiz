$: << "lib"

require 'sinatra'
require 'capybara/cucumber'

require 'kbiz'

Capybara.app = Kbiz.app
