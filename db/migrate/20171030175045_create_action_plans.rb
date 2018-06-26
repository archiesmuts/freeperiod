class CreateActionPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :action_plans do |t|
      t.uuid :goal_id, foreign_key: true, index: true
      t.string :what
      t.string :who
      t.date :when_date
      t.boolean :completed, default: false, null: false
      t.boolean :discarded, default: false, null: false
      t.integer :position
      t.string :slug, null: false, unique: true, index: true

      t.timestamps
    end
  end
end
