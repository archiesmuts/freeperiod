class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events, id: :uuid do |t|
      t.uuid :school_id, foreign_key: true, index: true
      t.string :title
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.string :slug, null: false, unique: true, index: true
      t.integer :version, null: false, default: 0
      t.jsonb :details, null: false, default: '{}'

      t.timestamps
    end
    add_index  :events, :details, using: :gin
  end
end
