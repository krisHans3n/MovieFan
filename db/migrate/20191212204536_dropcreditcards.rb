class Dropcreditcards < ActiveRecord::Migration[6.0]
  def change
    drop_table :creditcards
  end
end
