class AddTitleList9000ToMovie < ActiveRecord::Migration[6.0]
  def change
    add_reference :movies, :title_list9000s, foreign_key: true
  end
end
