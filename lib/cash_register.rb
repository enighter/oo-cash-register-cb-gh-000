class CashRegister

  attr_accessor :total, :discount, :items

  def initialize(discount = 0)
    self.total = 0
    self.discount = discount
    self.items = []
    @last_transaction = {
      quantity: 0,
      price: 0
    }
  end

  def add_item(title, price, quantity = 1)
    quantity.times do
      self.total += price
      self.items << title
    end
    @last_transaction[:quantity] = quantity
    @last_transaction[:price] = price
  end

  def apply_discount
    if discount == 0
      "There is no discount to apply."
    else
      self.total = (100 - discount) * total / 100
      "After the discount, the total comes to $#{self.total}."
    end
  end

  def void_last_transaction
    @last_transaction[:quantity].times do
      self.total -= @last_transaction[:price]
      self.items.pop
    end
  end

end
