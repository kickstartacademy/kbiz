require 'spec_helper'

require 'deal_type'
require 'role'
require 'stake'

module Kbiz
  describe DealType do
    it 'must have a name' do
      expect { Kbiz::DealType.new(nil, {}) }.to raise_error(ArgumentError)
      expect { Kbiz::DealType.new("", {}) }.to raise_error(ArgumentError)
    end

    subject { DealType.new("name", {}) }
    let(:role) { Role.new("name", "description") }
    let(:another_role) { Role.new("name", "description") }

    it 'allows addition of roles with stake' do
      added = subject.add_role(role, Stake.new(500))
      added.role_count.should == 1
    end

    it 'shows the total stake assigned' do
      subject.total_stake_assigned.should == Stake.new(0)
      subject.add_role(role, Stake.new(500)).total_stake_assigned.should == Stake.new(500)
    end

    it 'shows the total stake for a set of roles' do
      subject.total_stake_assigned.should == Stake.new(0)
      with_roles = subject.add_role(role, Stake.new(500)).add_role(another_role, Stake.new(250))
      with_roles.total_stake_for_roles([role]).should == Stake.new(500)
      with_roles.total_stake_for_roles([another_role]).should == Stake.new(250)
      with_roles.total_stake_for_roles([]).should == Stake.new(0)
    end

    it 'shows the amount of stake left to assign' do
      subject.stake_left_to_assign.should == Stake.new(10000)
      subject.add_role(role, Stake.new(500)).stake_left_to_assign.should == Stake.new(9500)
    end

    it 'is complete if the stakes total 100%' do
      expect(subject).not_to be_complete
      expect(subject.add_role(role, Stake.new(10000))).to be_complete
    end
  end
end
