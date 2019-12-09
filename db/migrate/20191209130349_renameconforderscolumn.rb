class Renameconforderscolumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :confirmed_orders, :users_id, :user_id
    rename_column :confirmed_orders, :orders_id, :order_id

  end
end
