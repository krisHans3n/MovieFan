class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.integer :quantity
      t.references :merchandises

      t.timestamps
    end
  end
end
