class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools, id: :uuid do |t|
      t.string :name
      t.text :description
      t.string :slug, null: false, unique: true, index: true
      t.jsonb :prospectus, null: false, default: {}
      t.jsonb :preferences, null: false, default: {}

      t.timestamps

    end
    add_index  :schools, :prospectus, using: :gin
    add_index  :schools, :preferences, using: :gin
  end
end
