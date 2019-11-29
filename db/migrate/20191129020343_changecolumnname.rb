class Changecolumnname < ActiveRecord::Migration[6.0]
  def change
    rename_column :lineitems, :merchandises_id, :merchandise_id
    rename_column :lineitems, :carts_id, :cart_id
  end
end
