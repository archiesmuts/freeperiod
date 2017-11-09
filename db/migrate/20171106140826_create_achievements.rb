class CreateAchievements < ActiveRecord::Migration[5.1]
  def change
    create_table :achievements, id: :uuid do |t|
      t.string :title
      t.text :description
      t.date :date
      t.string :slug, null: false, unique: true
      t.uuid :achievable_id, foreign_key: true, index: true
      t.string :achievable_type, index: true
      t.timestamps
    end
  end
end
