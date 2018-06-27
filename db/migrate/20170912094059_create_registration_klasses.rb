class CreateRegistrationKlasses < ActiveRecord::Migration[5.1]
  def change
    create_table :registration_klasses, id: :uuid do |t|
      t.string :name
      t.uuid :school_id, foreign_key: true
      t.uuid :course_id, foreign_key: true
      t.date :year
      t.string :slug, null: false, unique: true, index: true
      t.jsonb :data, null: false, default: {}

      t.timestamps
    end
    add_index  :registration_klasses, :data, using: :gin
  end
end
