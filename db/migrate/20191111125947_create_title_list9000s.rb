class CreateTitleList9000s < ActiveRecord::Migration[6.0]
  def change
    create_table :title_list9000s do |t|
      t.integer :movieId
      t.string :title

      t.timestamps
    end
  end
end
