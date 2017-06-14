module PriceCalculator

  UNIT_PRICE = 8

  def self.checkout(cart)
    # compute lots array
   cart.size * UNIT_PRICE * discount(cart)
  end

  def self.discount(cart)
    return 1 - 0.05 if cart == cart.uniq && cart.size == 2
    1
  end

  def self.cart_lots(cart)
    lots = []
    while cart != cart.uniq do
      lots << cart.uniq
      cart.uniq.each do |book|
        position = cart.find_index(book)
        cart.delete_at position
      end
    end
    lots << cart
    lots.compact
  end
end
