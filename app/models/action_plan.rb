class ActionPlan < ApplicationRecord
  resourcify
  extend FriendlyId
  friendly_id :what, use: :slugged
  belongs_to :goal, inverse_of: :action_plans
  acts_as_list scope: :goal
  validates :goal_id, :what, :slug, presence: true
  scope :completed, -> { where("completed = ?", true)}

  scope :action_items, -> { where("when_date IS NOT NULL")}
  scope :todo_items, -> { where("when_date IS NULL")}
  def should_generate_new_friendly_id?
    what_changed?
  end

end