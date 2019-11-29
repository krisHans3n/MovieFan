class Renamemwforeignkey < ActiveRecord::Migration[6.0]
  def change
    rename_column :movieswatcheds, :movies_id, :movie_id
  end
end
