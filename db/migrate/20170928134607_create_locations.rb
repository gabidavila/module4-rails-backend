class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :city, null: false
      t.string :state, limit: 2, null: false

      t.timestamps
    end
  end
end
