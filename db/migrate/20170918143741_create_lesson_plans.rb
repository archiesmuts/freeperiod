class CreateLessonPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :lesson_plans, id: :uuid do |t|
      t.string :name
      t.uuid :registration_klass_id, foreign_key: true
      t.integer :term, null: false, default: 0
      t.string :slug, null: false, unique: true
      t.text :description
      t.text :assessment_details
      
      t.timestamps
    end
  end
end
