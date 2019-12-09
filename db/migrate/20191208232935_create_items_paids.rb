class CreateItemsPaids < ActiveRecord::Migration[6.0]
  def change
    create_table :items_paids do |t|
      t.references :merchandises, null: false, foreign_key: true
      t.references :orders_paids, null: false, foreign_key: true

      t.timestamps
    end
  end
end
