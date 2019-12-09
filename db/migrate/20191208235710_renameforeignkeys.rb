class Renameforeignkeys < ActiveRecord::Migration[6.0]
  def change
    rename_column :items_paids, :merchandises_id, :merchandise_id 
    rename_column :items_paids, :orders_paids_id, :orders_paid_id 
    rename_column :orders_paids, :users_id, :user_id
  end
end
