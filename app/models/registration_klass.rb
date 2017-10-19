class RegistrationKlass < ApplicationRecord
  resourcify
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :school, inverse_of: :registration_klasses
  belongs_to :course, inverse_of: :registration_klasses
  has_many :user_registrations
  has_many :users, through: :user_registrations
  has_many :lesson_plans

  validates :school_id, :course_id, :name, :klass_type, :year, :slug, presence: true
  # TODO add completed_at date and completed boolean that will update completed_at

  enum klass_type: {
    subject_class: 0,
    registration_class: 1,
    school_faculty: 2
  }

  def should_generate_new_friendly_id?
    name_changed?
  end

  def course_name
    course.try(:name)
  end

  def course_name=(name)
    self.course = Course.where(name: name).take if name.present?
  end
end
