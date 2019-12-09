class Droptable < ActiveRecord::Migration[6.0]
  def change
    drop_table :items_paids 
    drop_table :orders_paids
  end
end
