class CreateMerchorders < ActiveRecord::Migration[6.0]
  def change
    create_table :merchorders do |t|
      t.integer :quantity
      t.references :merchandises, null: false, foreign_key: true

      t.timestamps
    end
  end
end
