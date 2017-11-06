class Goal < ApplicationRecord
  resourcify
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :goalable, polymorphic: true
  has_many :action_plans, -> { order('position ASC') }, inverse_of: :goal
  has_many :comments, as: :commentable

  validates :name, :deadline, :slug, :achievability, :achieved, presence: true
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

  def goal_achieved?
    achieved == "yes"
  end

end
