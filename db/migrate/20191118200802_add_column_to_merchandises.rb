class AddColumnToMerchandises < ActiveRecord::Migration[6.0]
  def change
    add_column :merchandises, :stocknumber, :integer
  end
end
