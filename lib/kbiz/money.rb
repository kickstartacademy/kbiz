module Kbiz
  class Money
    include Kbiz.initializer(:pence)
  end

  class MoneyNotSpecified
    def ==(other)
      other.is_a?(self.class)
    end
  end
end
