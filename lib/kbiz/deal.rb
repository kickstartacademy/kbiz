module Kbiz
  class Deal
    include Kbiz.initializer(:name, :identifier, :revenue)

    def initialize(*)
      super
      raise ArgumentError if @name.nil? || @name == ''
    end

    def revenue
      @revenue
    end
  end
end
