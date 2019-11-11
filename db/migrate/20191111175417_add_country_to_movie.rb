class AddCountryToMovie < ActiveRecord::Migration[6.0]
  def change
    add_reference :movies, :countries, foreign_key: true
  end
end
