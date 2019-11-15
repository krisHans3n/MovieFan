class CreateSubplans < ActiveRecord::Migration[6.0]
  def change
    create_table :subplans do |t|
      t.string :plantype
      t.boolean :recurring

      t.timestamps
    end
  end
end
