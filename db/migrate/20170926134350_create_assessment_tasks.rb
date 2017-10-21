class CreateAssessmentTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :assessment_tasks, id: :uuid do |t|
      t.uuid :assessment_type_id, foreign_key: true
      t.string :name
      t.string :slug, null: false, unique: true

      t.timestamps
    end
  end
end
