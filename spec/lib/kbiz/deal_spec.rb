require 'spec_helper'
require 'deal'
require 'deal_type'
require 'role'
require 'assignment'
require 'stake'
require 'money'

module Kbiz
  describe Deal do
    let(:deal_type) { DealType.new("public", {}) }

    subject { Deal.new("name", "id", Money.new(0), deal_type) }

    it 'allows creation with name, identifier, money and type' do
      expect { subject }.not_to raise_error
    end

    it 'returns an assigment count of 0' do
      expect(subject.assignment_count).to eq(0)
    end

    context 'with roles in the deal type' do
      let(:role) { Role.new("name", "description") }
      let(:deal_type) { DealType.new("public", {}).add_role(role, Stake.new(4000)) }

      it 'returns an assigment count of 0' do
        expect(subject.assignment_count).to eq(1)
      end

      it 'creates a vacant assignment for each role on creation' do
        expect(subject.assignments).to eq([VacantAssignment.new(role)])
      end
    end
  end
end
