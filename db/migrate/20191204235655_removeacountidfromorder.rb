class Removeacountidfromorder < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :accounts_id
  end
end
