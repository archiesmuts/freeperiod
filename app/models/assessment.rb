class Assessment < ApplicationRecord
  resourcify
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :lesson_plan
  belongs_to :assessment_type
  belongs_to :assessment_task
  has_many :parts, inverse_of: :assessment, dependent: :destroy
  has_many :results, inverse_of: :assessment, dependent: :destroy
  has_many :user_registrations, through: :results

  validates :lesson_plan_id, :name, :value, :assessment_type_id, :assessment_task_id, presence: true
  validates :value, numericality: true
  validates :value, numericality: { greater_than_or_equal_to: 0 }



   def total_value
     parts.sum(:value)
   end
  #  def total_mark
  #    parts.sum(:student_mark)
  #  end

  def lesson_plan_name
    self.lesson_plan.name
  end
  def should_generate_new_friendly_id?
    name_changed?
  end
end
