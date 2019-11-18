class CreateCreditcards < ActiveRecord::Migration[6.0]
  def change
    create_table :creditcards do |t|
      t.integer :number
      t.string :expdate
      t.string :nameoncard
      t.string :organisationtype
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
