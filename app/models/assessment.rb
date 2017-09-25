class Assessment < ApplicationRecord
  resourcify
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :lesson_plan
  validates :lesson_plan_id, :name, :assessment_type, presence: true

  enum assessment_type: {
    test: 0,
    exam: 1,
    practical_task: 2,
    investigation: 3,
    project: 4
  }
  def lesson_plan_name
    self.lesson_plan.name
  end
  def should_generate_new_friendly_id?
    name_changed?
  end
end
