require 'pry'

class CashRegister
    attr_accessor :total, :items, :last_trasnaction
    attr_reader :discount
    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @money_off = 0
        @items = []
        @previous_total = []
    end
    def add_item(title, price, quantity=1)
        @previous_total = @total
        @total += price*quantity
        quantity.times{@items << title}
    end
    def apply_discount
        if(@discount == 0)
            "There is no discount to apply."
        else
            @discount = @total * (@discount.to_f / 100)
            @total -= @discount.to_i
            "After the discount, the total comes to $#{@total}."
        end
    end
    def items
        @items
    end
    def void_last_transaction
        @total = @previous_total
    end
end
 binding.pry