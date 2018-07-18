class CashRegister
  attr_accessor :total
  attr_reader :discount

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    @total += price * quantity

    quantity.times do
      @items << {
        title: title,
        price: price
      }
    end
  end

  def items
    @items.map do |item|
      item[:title]
    end
  end

  def apply_discount
    if @discount > 0
      discount_percentage = self.discount / 100.0
      @total *= 1 - discount_percentage
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @items[@items.size - 1][:price]
    @items.pop
  end
end
