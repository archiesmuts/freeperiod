class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments, id: :uuid do |t|
      t.text :comment
      t.uuid :commentable_id, foreign_key: true, index: true
      t.string :commentable_type, index: true
      t.uuid :user_id, foreign_key: true, index: true

      t.timestamps
    end
  end
end
