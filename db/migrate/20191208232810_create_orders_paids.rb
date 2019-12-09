class CreateOrdersPaids < ActiveRecord::Migration[6.0]
  def change
    create_table :orders_paids do |t|
      t.references :users, null: false, foreign_key: true
      t.decimal :total_price

      t.timestamps
    end
  end
end
