class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :Title
      t.string :Director
      t.decimal :Duration
      t.string :Genre
      t.integer :Year
      t.decimal :imdbscore

      t.timestamps
    end
  end
end
