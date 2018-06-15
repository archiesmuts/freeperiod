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

# Codes and percentages for recording and reporting
# Rating code
# Description of competence
# Percentage
# 7
# Outstanding achievement
# 80-100
# 6
# Meritorious achievement
# 70-79
# 5
# Substantial achievement
# 60-69
# 4
# Adequate achievement
# 50-59
# 3
# Moderate achievement
# 40-49
# 2
# Elementary achievement
# 30-39
# 1
# Not achieved
# 0-29
