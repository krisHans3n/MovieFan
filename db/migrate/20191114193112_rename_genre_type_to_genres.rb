class RenameGenreTypeToGenres < ActiveRecord::Migration[6.0]
  def change
    rename_column :genres, :type, :genre

  end
end
