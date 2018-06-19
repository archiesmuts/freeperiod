class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances, id: :uuid do |t|
      t.text :comment
      t.date :date
      t.uuid :attendable_id, foreign_key: true, index: true
      t.string :attendable_type, index: true
      t.jsonb :details, null: false, default: '{}'

      t.timestamps
    end
    add_index  :attendances, :details, using: :gin
  end
end
