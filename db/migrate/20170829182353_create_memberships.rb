class CreateMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :memberships, id: :uuid do |t|
      t.uuid :user_id, foreign_key: true
      t.uuid :school_id, foreign_key: true
      t.integer :member, null: false, default: 0

      t.timestamps
    end
  end
end
