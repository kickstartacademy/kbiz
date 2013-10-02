module Kbiz
  class Stake
    include Kbiz.initializer(:percentage_hundredths)

    def initialize(*)
      super
      raise ArgumentError unless @percentage_hundredths.kind_of?(Fixnum)
      raise ArgumentError if @percentage_hundredths > 10000
      raise ArgumentError if @percentage_hundredths < 0
    end

    attr :percentage_hundredths

    def ==(other)
      @percentage_hundredths == other.percentage_hundredths
    end

    def -(other)
      Stake.new(@percentage_hundredths - other.percentage_hundredths)
    end

    def +(other)
      Stake.new(@percentage_hundredths + other.percentage_hundredths)
    end
  end

  class WagesInsteadOfStake
    def percentage_hundredths
      0
    end
  end
end
