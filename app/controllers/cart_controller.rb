class CartController < ApplicationController


    #should be used to interface with merchorders [aka 'cart']
    def show
        @merch = cart_order.merchorders 
        
    end
    

end
