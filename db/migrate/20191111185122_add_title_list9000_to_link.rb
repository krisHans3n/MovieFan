class AddTitleList9000ToLink < ActiveRecord::Migration[6.0]
  def change
    add_reference :links, :title_list9000s, foreign_key: true
  end
end
