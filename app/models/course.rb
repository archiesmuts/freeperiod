class Course < ApplicationRecord
  resourcify
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :registration_klasses, inverse_of: :course
  belongs_to :grade, inverse_of: :courses
  belongs_to :subject, inverse_of: :courses

  validates :subject_id, :grade_id, :name, :subject_type, :slug, presence: true

  enum subject_type: {
    subject: 0,
    registration: 1,
    sport: 2,
    extracurricular: 3
  }

  jsonb_accessor :details,
    sector: :string

  def course_description
    "#{grade_name} - #{subject_name} - #{name}"
  end

  def subject_name
    self.subject.name
  end

  def grade_name
    self.grade.name
  end

  def should_generate_new_friendly_id?
    name_changed?
  end

end
