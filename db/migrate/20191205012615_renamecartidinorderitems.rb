class Renamecartidinorderitems < ActiveRecord::Migration[6.0]
  def change
    rename_column :order_items, :carts_id, :cart_id
  end
end
