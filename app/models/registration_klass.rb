  class RegistrationKlass < ApplicationRecord
  resourcify
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :school, inverse_of: :registration_klasses
  belongs_to :course, inverse_of: :registration_klasses
  has_many :user_registrations, inverse_of: :registration_klass
  has_many :users, through: :user_registrations
  has_many :lesson_plans, inverse_of: :registration_klass
  has_many :goals, as: :goalable
  has_many :achievements, as: :achievable
  # has_many :teachers, -> {where(user_type: ['teacher','substitute_teacher'] )}, class_name: "UserRegistration"
  # has_many :learners, -> {where(user_type: "learner" )}, class_name: "UserRegistration"
  scope :reg_classes, -> { data_where(group_type: "Registration Class") }
  scope :subj_classes, -> { data_where(group_type: "Subject Class") }

  validates :school_id, :course_id, :name, :data, :year, :slug, presence: true
  # TODO add more items to data
  jsonb_accessor :data,
    group_type:   [:string, default: "Registration Class"],
    sport_type: :string,
    more_information: :string
    # TODO add preferences to show/hide recording of attendances
  def should_generate_new_friendly_id?
    name_changed?
  end

  def course_name
    course.try(:name)
  end

  def course_name=(name)
    self.course = Course.where(name: name).take if name.present?
  end

  # def grade
  #   self.course.grade_name
  # end
end
