class CreatePayAgreements < ActiveRecord::Migration[5.1]
  def change
    create_table :pay_agreements, id: :uuid do |t|
      t.uuid :fee_id, foreign_key: true
      t.uuid :user_registration_id, foreign_key: true
      t.decimal :discount, default: 0, null: false
      t.text :comment
      t.string :slug, null: false, unique: true, index: true
      t.integer :version, null: false, default: 0
      t.jsonb :details, null: false, default: '{}'

      t.timestamps
    end
    add_index  :pay_agreements, :details, using: :gin
  end
end
