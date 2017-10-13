class CreateFees < ActiveRecord::Migration[5.1]
  def change
    create_table :fees, id: :uuid do |t|
      t.uuid :school_id, foreign_key: true
      t.string :name
      t.date :year
      t.decimal :amount
      t.string :slug, null: false, unique: true

      t.timestamps
    end
  end
end
