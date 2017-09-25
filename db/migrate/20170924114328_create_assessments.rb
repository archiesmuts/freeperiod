class CreateAssessments < ActiveRecord::Migration[5.1]
  def change
    create_table :assessments, id: :uuid do |t|
      t.string :name
      t.uuid :lesson_plan_id, foreign_key: true
      t.integer :assessment_type, null: false, default: 0
      t.string :slug, null: false, unique: true

      t.timestamps
    end
  end
end
