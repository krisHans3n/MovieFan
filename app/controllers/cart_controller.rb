class CartController < ApplicationController


    def show
        @merch = cart_order.merchorders 
        
    end
    

end
