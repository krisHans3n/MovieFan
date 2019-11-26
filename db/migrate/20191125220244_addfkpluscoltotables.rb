class Addfkpluscoltotables < ActiveRecord::Migration[6.0]
  def change
    add_reference :movieswatcheds, :users, foreign_key: true
    add_reference :creditcards, :users, foreign_key: true
    add_reference :addresses, :users, foreign_key: true
    add_reference :merchorders, :users, foreign_key: true
    add_column :merchpayments, :total, :decimal
  end
end
