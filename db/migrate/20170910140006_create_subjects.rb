class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects, id: :uuid do |t|
      t.string :name
      t.text   :description
      t.string :slug, null: false, unique: true, index: true
      t.jsonb :details, null: false, default: {}

      t.timestamps
    end
    add_index  :subjects, :details, using: :gin
  end
end
