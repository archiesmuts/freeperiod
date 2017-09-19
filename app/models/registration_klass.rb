class RegistrationKlass < ApplicationRecord
  resourcify
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :school
  belongs_to :course
  has_many :registrations
  has_many :users, through: :registrations
  has_many :lesson_plans

  validates :school_id, :course_id, :name, :klass_type, :year, :slug, presence: true
  # TODO add completed_at date and completed boolean that will update completed_at

  enum klass_type: {
    subject_class: 0,
    registration_class: 1
  }

  def should_generate_new_friendly_id?
    name_changed?
  end

  def course_name
    self.course.name
  end
end
