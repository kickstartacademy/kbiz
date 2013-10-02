require 'spec_helper'
require 'stake'
require 'money'

module Kbiz
  describe Stake do
    it 'must be passed a 100th percentage - a whole number between one and 10000' do
      expect { Stake.new(0) }.not_to raise_error
      expect { Stake.new(10000) }.not_to raise_error

      expect { Stake.new(10001) }.to raise_error
      expect { Stake.new(-1) }.to raise_error
      expect { Stake.new(10.01) }.to raise_error
      expect { Stake.new("") }.to raise_error
      expect { Stake.new(nil) }.to raise_error
    end

    it 'can take one Stake from another' do
      expect(Stake.new(100) - Stake.new(90)).to eq(Stake.new(10))
    end

    it 'can add stakes together' do
      expect(Stake.new(100) + Stake.new(90)).to eq(Stake.new(190))
    end

    it 'can slice a money by itself' do
      expect(Stake.new(5000).slice_of(Money.new(1000))).to eq(Money.new(500))
    end
  end
end
