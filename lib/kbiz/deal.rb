module Kbiz
  class Deal
    include Kbiz.initializer(:name, :identifier)

    def initialize(*)
      super
      raise ArgumentError if @name.nil? || @name == ''
      raise ArgumentError if @identifier.nil? || @identifier == ''
    end
  end
end
