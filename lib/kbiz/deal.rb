module Kbiz
  class Deal
    include Kbiz.initializer(:name, :identifier, :revenue)

    def initialize(*)
      super
      raise ArgumentError if @name.nil? || @name == ''
      raise ArgumentError if @identifier.nil? || @identifier == ''
    end

    def revenue
      @revenue
    end
  end
end
