class CreateLineitems < ActiveRecord::Migration[6.0]
  def change
    create_table :lineitems do |t|
      t.references :merchandises, null: false, foreign_key: true
      t.belongs_to :carts, null: false, foreign_key: true

      t.timestamps
    end
  end
end
