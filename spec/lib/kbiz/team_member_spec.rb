require 'spec_helper'

require 'team_member'
require 'role'
require 'stake'

module Kbiz
  describe TeamMember do
    it 'must have a twitter handle' do
      TeamMember.new("chrismdp")
      expect { TeamMember.new(nil) }.to raise_error(ArgumentError)
      expect { TeamMember.new("") }.to raise_error(ArgumentError)
    end
  end
end
