module PriceCalculator

  UNIT_PRICE = 8

  def self.checkout(cart)
   cart.size * UNIT_PRICE * discount(cart)
  end

  def self.discount(cart)
    return 1 - 0.05 if cart == cart.uniq && cart.size == 2
    1
  end
end
