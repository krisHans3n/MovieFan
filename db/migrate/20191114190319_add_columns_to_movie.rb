class AddColumnsToMovie < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :actor1, :string
    add_column :movies, :actor2, :string
    add_column :movies, :keywords, :string
    add_column :movies, :language, :string
    add_column :movies, :contentrating, :string
  end
end
