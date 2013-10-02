$: << 'lib'

require 'bundler/setup'
require 'sinatra'

Bundler.require :default, Sinatra::Application.environment

require 'kbiz'

run Kbiz.app
