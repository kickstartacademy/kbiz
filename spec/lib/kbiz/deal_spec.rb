require 'spec_helper'
require 'deal'
require 'deal_type'
require 'role'
require 'team_member'
require 'assignment'
require 'stake'
require 'money'

module Kbiz
  describe Deal do
    let(:deal_type) { DealType.new("public", {}) }

    subject { Deal.new("name", "id", Money.new(0), deal_type, {}) }

    it 'allows creation with name, identifier, money and type' do
      expect { subject }.not_to raise_error
    end

    it 'returns an assigment count of 0' do
      expect(subject.assignment_count).to eq(0)
    end

    context 'with roles in the deal type' do
      let(:role) { Role.new("name", "description") }
      let(:deal_type) { DealType.new("public", {}).add_role(role, Stake.new(4000)) }
      let(:team_member) { TeamMember.new("chrismdp") }

      let(:with_roles) { subject.with_new_deal_type(deal_type) }

      it 'returns an assigment count of 0' do
        expect(with_roles.assignment_count).to eq(1)
      end

      it 'creates a vacant assignment for each role on creation' do
        expect(with_roles.assignments).to eq({role => VacantAssignment.new})
      end

      it 'allows assigning a team member to the role' do
        expect(with_roles.assign(team_member, role).assignment_for(role)).to eq(Assignment.new(team_member))
      end

      it 'returns the roles assigned to a team member' do
        expect(with_roles.assign(team_member, role).roles_assigned_to(team_member)).to eq([role])
      end

      it 'allows the removal of an assignment' do
        expect(with_roles.assign(team_member, role).remove_assignation(role).assignments).
          to eq(with_roles.assignments)
      end
    end
  end
end
