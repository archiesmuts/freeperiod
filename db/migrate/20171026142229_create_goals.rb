class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals, id: :uuid do |t|
      t.string :name
      t.date :deadline
      t.integer :achievability, null: false, default: 0
      t.integer :visibility, null: false, default: 0
      t.string :measurement
      t.string :person_responsible
      t.integer :achieved, null: false, default: 0
      t.date :completed_at
      t.uuid :goalable_id, foreign_key: true, index: true
      t.string :goalable_type, index: true
      t.string :slug, null: false, unique: true, index: true

      t.timestamps
    end
  end
end
