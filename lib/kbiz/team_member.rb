module Kbiz
  class TeamMember
    include Kbiz.initializer(:twitter_handle)

    def initialize(*)
      super
      raise ArgumentError if @twitter_handle.nil? || @twitter_handle == ''
    end
  end
end
