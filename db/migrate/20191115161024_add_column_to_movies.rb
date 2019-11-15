class AddColumnToMovies < ActiveRecord::Migration[6.0]
  def change
    add_reference :movies, :merchandises, foreign_key: true
  end
end
