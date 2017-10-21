class AssessmentTask < ApplicationRecord
  resourcify
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :assessment_type
  validates :name, :slug, :assessment_type_id, presence: true

  def should_generate_new_friendly_id?
    name_changed?
  end
end
