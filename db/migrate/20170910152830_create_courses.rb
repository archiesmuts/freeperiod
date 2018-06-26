class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses, id: :uuid do |t|
      t.string :name
      t.uuid :grade_id, foreign_key: true
      t.uuid :subject_id, foreign_key: true
      t.integer :subject_type, null: false, default: 0
      t.string :slug, null: false, unique: true, index: true
      t.jsonb :details, null: false, default: '{}'

      t.timestamps
    end
    add_index  :courses, :details, using: :gin
  end
end
