class Addtotalandstatustoorders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :status, :string
    add_column :orders, :total_price, :decimal
  end
end
