require 'Pry'

class CashRegister
  attr_reader :discount
  attr_accessor :total, :last_transaction, :items

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    self.total += price * quantity
    quantity.times do
      @items << title
    end
    self.last_transaction = price * quantity
  end

  def apply_discount
    if discount != 0
      self.total = (total * (100 - discount.to_f)/100).to_i
      return "After the discount, the total comes to $#{self.total}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    return @items
  end

  def void_last_transaction
    self.total = self.total - self.last_transaction
  end

end

test = CashRegister.new
