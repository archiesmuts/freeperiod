class CreateUserRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :user_registrations, id: :uuid do |t|
      t.uuid :registration_klass_id, foreign_key: true
      t.uuid :user_id, foreign_key: true
      t.integer :user_type, null: false, default: 0
      t.boolean :completed, null: false, default: false
      t.datetime :completed_at
      t.string :slug, null: false, unique: true

      t.timestamps
    end
  end
end
