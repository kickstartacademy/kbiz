require 'spec_helper'
require 'deal'
require 'deals_list'
require 'money'

module Kbiz
  describe DealsList do
    let(:deal1) { double(:revenue => Money.new(100)) }
    let(:deal2) { double(:revenue => Money.new(28)) }
    let(:deals) { [deal1, deal2] }

    it 'returns revenue for all the deals in the list' do
      DealsList.new(deals).revenue.should == Money.new(128)
    end

    let(:not_specified) { double(:revenue => MoneyNotSpecified.new) }
    it 'handles MoneyNotSpecified by returning 0 for those' do
      DealsList.new([ deal1, not_specified ]).revenue.should == Money.new(100)
    end

  end
end
