class LessonPlan < ApplicationRecord
  resourcify
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :registration_klass
  has_many :assessments

  validates :name, :term, :slug, presence: true

  enum term: {
    one: 0,
    two: 1,
    three: 2,
    four: 3
  }
  def klass_name
    self.registration_klass.name
  end
  def should_generate_new_friendly_id?
    name_changed?
  end
end
