class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction

    def initialize(discount=0, total=0)
        @total=total
        @discount=discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        self.total += price*quantity
        self.last_transaction = price*quantity
        if quantity==1
            self.items << title
        else
            quantity.times{self.items << title}
        end
    end

    def apply_discount
        if self.discount==0
            return "There is no discount to apply."
        else
            self.total -= self.total*(self.discount/100.to_f)
            return "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end
end
