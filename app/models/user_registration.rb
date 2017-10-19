class UserRegistration < ApplicationRecord
  resourcify
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  after_update :set_completed_at
  belongs_to :user
  belongs_to :registration_klass
  has_many :results, inverse_of: :user_registration
  has_many :assessments, through: :results
  has_many :pay_agreements, inverse_of: :user_registration
  has_many :fees, through: :pay_agreements
  has_many :attendances, -> { order "date" }, as: :attendable
  # scope :for_this_klass, -> { where(field: true)   }
  validates :user_id, :registration_klass_id, :user_type, presence: true
  validates :completed, inclusion: { in: [true, false] }

  enum user_type: {
    learner: 0,
    teacher: 1,
    substitute_teacher: 2
  }

  # def self.registered_user
  #   user
  # end
  def user_name
    self.user.try(:full_name)
  end
  def registration_klass_name
    self.registration_klass.try(:name)
  end
  def registration_klass_year
    self.registration_klass.try(:year)
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
    if completed_changed? && completed == true
      update_column(:completed_at, Time.now)
    end
  end
end
