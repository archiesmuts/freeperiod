class CreateMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :memberships, id: :uuid do |t|
      t.uuid :user_id, foreign_key: true
      t.uuid :school_id, foreign_key: true
      t.integer :primary_role, null: false, default: 0
      t.string :slug, null: false, unique: true, index: true
      t.jsonb :details, null: false, default: {}

      t.timestamps
    end
    add_index  :memberships, :details, using: :gin
  end
end
