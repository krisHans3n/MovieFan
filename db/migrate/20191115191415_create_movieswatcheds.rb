class CreateMovieswatcheds < ActiveRecord::Migration[6.0]
  def change
    create_table :movieswatcheds do |t|
      t.references :movies

      t.timestamps
    end
  end
end
