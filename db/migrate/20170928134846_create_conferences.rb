class CreateConferences < ActiveRecord::Migration[5.1]
  def change
    create_table :conferences do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :url, null: false
      t.string :image_uri, null: true
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.integer :location_id, limit: 8, foreign_key: true, null: false
      t.integer :organizer_id, limit: 8, foreign_key: true, null: false

      t.timestamps
    end
  end
end
