class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results, id: :uuid do |t|
      t.uuid :user_registration_id
      t.uuid :assessment_id
      t.decimal :student_score, default: 0
      t.text :teacher_comment

      t.timestamps
    end
  end
end
