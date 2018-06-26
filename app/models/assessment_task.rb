class AssessmentTask < ApplicationRecord
  resourcify
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :assessment_type, inverse_of: :assessment_tasks
  validates :name, :description, :slug, :assessment_type_id, presence: true

  def should_generate_new_friendly_id?
    name_changed?
  end
end
