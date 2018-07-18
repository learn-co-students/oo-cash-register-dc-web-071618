require 'pry'

class CashRegister
  attr_accessor :total, :last_transaction
  attr_reader :discount

  def initialize(discount=nil)
    @total = 0
    @discount = discount
    @all_items = []
  end

  def add_item(title, price, quantity=1)
    self.total += price*quantity
    quantity.times do
      @all_items << title
    end
    @last_transaction = price*quantity
  end

  def apply_discount
    if discount == nil
      "There is no discount to apply."
    else
      @total = self.total.to_f - self.discount.to_f/100*self.total
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    @all_items
  end

  def void_last_transaction
    @total = self.total - @last_transaction.to_f
  end

end
