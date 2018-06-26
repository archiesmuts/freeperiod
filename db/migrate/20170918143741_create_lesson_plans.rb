class CreateLessonPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :lesson_plans, id: :uuid do |t|
      t.string :name
      t.uuid :registration_klass_id, foreign_key: true
      t.string :slug, null: false, unique: true, index: true
      t.text :description
      t.jsonb :details, null: false, default: '{}'

      t.timestamps
    end
    add_index  :lesson_plans, :details, using: :gin
  end
end
