module Kbiz
  class DealsList
    include Kbiz.initializer(:deals)

    def revenue
      deals.map(&:revenue).inject(Money.new(0), :+)
    end
  end
end
