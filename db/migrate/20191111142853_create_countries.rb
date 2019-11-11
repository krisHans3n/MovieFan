class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :Ctrycode
      t.decimal :Lat
      t.decimal :Long
      t.string :Country

      t.timestamps
    end
  end
end
