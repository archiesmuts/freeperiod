class CreateAssessmentTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :assessment_types, id: :uuid do |t|
      t.string :name
      t.text :description
      t.string :slug, null: false, unique: true, index: true

      t.timestamps
    end
  end
end
