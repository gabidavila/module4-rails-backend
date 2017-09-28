class CreateTalks < ActiveRecord::Migration[5.1]
  def change
    create_table :talks do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :topic, null: false
      t.integer :speaker_id, limit: 8, foreign_key: true, null: false
      t.integer :conference_id, limit: 8, foreign_key: true, null: false

      t.timestamps

    end
   add_index :talks, :topic
   add_index :talks, :title
  end
end
