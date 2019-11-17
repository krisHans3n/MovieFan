class CreateSubscriptionpayments < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptionpayments do |t|
      t.references :users, null: false, foreign_key: true
      t.references :subplans, null: false, foreign_key: true

      t.timestamps
    end
  end
end
