class CreateConfirmedOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :confirmed_orders do |t|
      t.references :users, null: false, foreign_key: true
      t.references :orders, null: false, foreign_key: true

      t.timestamps
    end
  end
end
