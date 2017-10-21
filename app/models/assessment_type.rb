class AssessmentType < ApplicationRecord
  resourcify
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :assessments
  has_many :assessment_tasks, dependent: :destroy
  validates :name, :slug, presence: true

  def should_generate_new_friendly_id?
    name_changed?
  end
end
