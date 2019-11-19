class Addpricetosubpay < ActiveRecord::Migration[6.0]
  def change
    add_column :subscriptionpayments, :price, :decimal
  end
end
