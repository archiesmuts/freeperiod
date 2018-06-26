class UserRegistration < ApplicationRecord
  resourcify
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  after_update :set_completed_at

  belongs_to :user, inverse_of: :user_registrations
  belongs_to :registration_klass, inverse_of: :user_registrations

  has_many :results, inverse_of: :user_registration
  has_many :assessments, through: :results
  has_many :pay_agreements, inverse_of: :user_registration
  has_many :fees, through: :pay_agreements
  has_many :attendances, -> { order "date DESC" }, as: :attendable
  has_many :goals,-> { order "deadline ASC" }, as: :goalable
  has_many :achievements, -> { order('date DESC') }, as: :achievable

  # scope :for_this_klass, -> { where(field: true)   }
  validates :user_id, :registration_klass_id, presence: true
  validates_uniqueness_of :user_id, scope: :registration_klass_id, message: "already exists."
  validates :completed, inclusion: { in: [true, false] }

  jsonb_accessor :details,
    user_type: [:string, default: "Learner"],
    player_info: [:string, array: true, default: ["No info yet"]]

  scope :learners, -> { details_where(user_type: "Learner") }
  scope :active_learners, -> { learners.where(completed: false) }

  def user_name
    self.user.try(:full_name)
  end
  def registration_klass_name
    self.registration_klass.try(:name)
  end
  def registration_klass_year
    self.registration_klass.try(:year)
  end
  # TODO need validation for when a user is added to more than registration class, i.e. where klass_type == registration_class
  # def home_room
  #   self.registration_klass.where(klass_type: "registration_class")
  # end
  def school
    self.registration_klass.school
  end
  def slug_candidates
    [
      :user_name,
      [:user_name, :registration_klass_name],
      [:user_name, :registration_klass_name, :registration_klass_year],
    ]
  end

  def should_generate_new_friendly_id?
    user_id_changed? || registration_klass_id_changed?
  end

  private
  def set_completed_at
    if saved_change_to_completed? && completed == true
      update_column(:completed_at, Time.now)
    end
  end
end
