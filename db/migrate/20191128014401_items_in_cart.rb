class ItemsInCart < ActiveRecord::Migration[6.0]
  def up 
    Cart.all.each do |cart|
      sum = cart.Lineitems.group(:merchandises_id).sum(:quantity)
      sums.each do |merchandise_id, quantity|
        if quantity > 1
          cart.lineitems.where(merchandises_id: merchandise_id).delete_all 
          item = cart.lineitems.build(merchandises_id: merchandise_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end

  def down 
    Lineitem.where(" quantity > 1").each do |lineitem|
lineitem.quantity.times do  
  Lineitem.create(
    cart_id: lineitem.carts_id,
    merchandises_id: lineitem.merchandises_id, 
    quantity: 1
  )  
end

lineitem.destroy
  
end
end

end
