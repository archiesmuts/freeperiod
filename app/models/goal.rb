class Goal < ApplicationRecord
  resourcify
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :goalable, polymorphic: true
  has_many :action_plans, inverse_of: :goal
  has_many :action_items, -> { where("when_date IS NOT NULL")}, class_name: "ActionPlan"
  has_many :task_items, -> { where("when_date IS NULL")}, class_name: "ActionPlan"
  has_many :completed_items, -> { where(completed: true)}, class_name: "ActionPlan"
  has_many :comments, -> { order('created_at DESC') }, as: :commentable

  validates :name, :deadline, :slug, :achievability, :achieved, :visibility, presence: true
  validates :measurement, :person_responsible, presence: true, on: :update
  validates :completed_at, presence: true, on: :update, if: :goal_achieved?

  enum achievability: {
    still_deciding: 0,
    maybe: 1,
    not_a_chance: 2,
    yes_definitely: 3
  }
  enum achieved: {
    in_progress: 0,
    sadly_no: 1,
    yes: 2
  }
  enum version: {
    open: 0,
    closed: 1,
  }
  def goal_achieved?
    achieved == "yes"
  end
  def should_generate_new_friendly_id?
    name_changed?
  end
end
