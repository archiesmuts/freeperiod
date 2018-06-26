class CreateGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :grades, id: :uuid do |t|
      t.string :name
      t.string :slug, null: false, unique: true, index: true

      t.timestamps
    end
  end
end
