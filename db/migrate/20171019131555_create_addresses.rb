class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses, id: :uuid do |t|
      t.string :address, index: true
      t.integer :address_type, null: false, default: 0
      t.uuid :addressable_id, foreign_key: true, index: true
      t.string :addressable_type, index: true

      t.timestamps
    end
  end
end
