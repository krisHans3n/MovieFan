class Addprodcountrytomovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :productioncountry, :string
  end
end
