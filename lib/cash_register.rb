class CashRegister
    attr_accessor :total, :discount, :last_transaction
  
    def initialize(discount = nil)
      @total = 0
      @discount = discount
      @last_transaction = 0
      @items = []
    end
  
    def add_item(title, price, quantity = 1)
      @last_transaction = price * quantity
      @total += @last_transaction
      quantity.times do
        @items << title
      end
    end
  
    def apply_discount
      if @discount
        @total = (@total * (100 - @discount) / 100).round(2)
        "After the discount, the total comes to $#{@total}."
      else
        "There is no discount to apply."
      end
    end
  
    def items(title = nil, price = nil, quantity = nil)
      if title && price
        quantity.times do
          @items << title
        end
      end
      @items
    end
  
    def void_last_transaction
      @total -= @last_transaction
      @last_transaction = 0
    end
  end
  