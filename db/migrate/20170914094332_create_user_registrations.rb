class CreateUserRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :user_registrations, id: :uuid do |t|
      t.uuid :registration_klass_id, foreign_key: true
      t.uuid :user_id, foreign_key: true
      t.boolean :completed, null: false, default: false
      t.date :completed_at
      t.string :slug, null: false, unique: true, index: true
      t.jsonb :details, null: false, default: '{}'

      t.timestamps
    end
    add_index  :user_registrations, :details, using: :gin
  end
end
