class CreateRegistrationKlasses < ActiveRecord::Migration[5.1]
  def change
    create_table :registration_klasses, id: :uuid do |t|
      t.string :name
      t.uuid :school_id, foreign_key: true
      t.uuid :course_id, foreign_key: true
      t.date :year
      t.integer :klass_type, null: false, default: 0
      t.string :slug, null: false, unique: true

      t.timestamps
    end
  end
end
