class CreateParts < ActiveRecord::Migration[5.1]
  def change
    create_table :parts, id: :uuid do |t|
      t.uuid :assessment_id, foreign_key: true
      t.string :name
      t.text :description
      t.decimal :value, default: 0

      t.timestamps
    end
  end
end
