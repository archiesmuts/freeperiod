class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events, id: :uuid do |t|
      t.uuid :school_id, foreign_key: true, index: true
      t.string :title
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.string :slug, null: false, unique: true

      t.timestamps
    end
  end
end
