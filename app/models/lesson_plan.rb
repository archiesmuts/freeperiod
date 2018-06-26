class LessonPlan < ApplicationRecord
  resourcify
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :registration_klass, inverse_of: :lesson_plans
  has_many :assessments, inverse_of: :lesson_plan

  validates :name, :description, :details, :slug, presence: true

  jsonb_accessor :details,
    term: [:string, default: "1"],
    assessment_details: :string,
    more_information: :string

  def klass_name
    self.registration_klass.name
  end

  def should_generate_new_friendly_id?
    name_changed?
  end
end
