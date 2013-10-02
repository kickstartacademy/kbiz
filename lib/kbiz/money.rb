module Kbiz
  class Money
    include Kbiz.initializer(:pence)

    attr :pence

    def ==(other)
      other.pence == @pence
    end
  end

  class MoneyNotSpecified
    def ==(other)
      other.is_a?(self.class)
    end
  end
end
