class Addcolumntosubpay < ActiveRecord::Migration[6.0]
  def change
    add_column :subscriptionpayments, :subscription_level, :string
  end
end
