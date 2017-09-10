class CreateMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :memberships, id: :uuid do |t|
      t.uuid :user_id, foreign_key: true
      t.uuid :school_id, foreign_key: true
      t.integer :member, default: true

      t.timestamps
    end
  end
end
