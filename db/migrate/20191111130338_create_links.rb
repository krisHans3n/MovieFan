class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.integer :mId
      t.integer :imdbId
      t.integer :tmdId

      t.timestamps
    end
  end
end
