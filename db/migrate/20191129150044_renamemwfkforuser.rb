class Renamemwfkforuser < ActiveRecord::Migration[6.0]
  def change
    rename_column :movieswatcheds, :users_id, :user_id
  end
end
