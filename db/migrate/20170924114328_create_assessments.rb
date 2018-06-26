class CreateAssessments < ActiveRecord::Migration[5.1]
  def change
    create_table :assessments, id: :uuid do |t|
      t.string :name
      t.text  :description
      t.decimal :value, default: 0
      t.integer :version, null: false, default: 0
      t.uuid :lesson_plan_id, foreign_key: true
      t.uuid :assessment_type_id, foreign_key: true
      t.uuid :assessment_task_id, foreign_key: true
      t.string :slug, null: false, unique: true, index: true

      t.timestamps
    end
  end
end
