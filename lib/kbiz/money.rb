module Kbiz
  class Money
    include Kbiz.initializer(:pence)

    attr :pence

    def ==(other)
      other.pence == @pence
    end

    def ==(other)
      @pence == other.pence
    end

    def -(other)
      self.class.new(@pence - other.pence)
    end

    def +(other)
      self.class.new(@pence + other.pence)
    end

  end

  class MoneyNotSpecified
    def ==(other)
      other.is_a?(self.class)
    end

    def pence
      0
    end
  end
end
