require 'spec_helper'
require 'deal'
require 'money'

module Kbiz
  describe Deal do
    it 'allows creation with name, identifier and money' do
      Kbiz::Deal.new("name", "id", Money.new(0))
    end
  end
end
