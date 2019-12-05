class Addreferencetoorderitems < ActiveRecord::Migration[6.0]
  def change
    add_reference :order_items, :carts,  foreign_key: true

  end
end
