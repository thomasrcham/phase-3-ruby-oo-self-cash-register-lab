class CashRegister
  attr_accessor :discount, :total, :items, :transaction

  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @items = []
  end

  def add_item(item, price, quantity = 1)
    self.transaction = price * quantity
    self.total += self.transaction
    quantity.times { self.items << item }
  end

  def apply_discount
    if self.discount != 0
      discount_value = (100 - self.discount.to_f) / 100
      self.total = (self.total * discount_value).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= self.transaction
  end
end
