require "securerandom"
class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :omniauthable
  devise  :database_authenticatable, :registerable, :recoverable, :rememberable,
          :trackable, :validatable, :confirmable, :lockable, :timeoutable, :invitable

  before_create :generate_uuid, unless: :slug?
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  has_many :memberships, inverse_of: :user, dependent: :destroy
  has_many :schools, through: :memberships
  has_many :user_registrations
  has_many :registration_klasses, through: :user_registrations
  has_many :comments, as: :commentable
  has_many :addresses, as: :addressable
  has_many :goals, -> { order('deadline ASC') },  as: :goalable
  has_many :achievements, -> { order('date DESC') }, as: :achievable

  validates :first_name, :last_name, :slug, presence: true
  validates :terms_of_privacy_statement, acceptance: true
  validates_associated :memberships
  validates_associated :registration_klasses
  scope :registered_for_klass, -> {joins(schools: [:registration_klasses])
    .where(memberships: {member: ["learner", "educator"]} )
    .distinct
    .order("users.last_name ASC, users.first_name ASC")}

  scope :registered_teachers, -> { joins(schools: [:registration_klasses])
    .where(memberships: {member: "educator"})
    .distinct
    .order("users.last_name ASC, users.first_name ASC")}

  # def school_id
  #   school_ids.first
  # end
  def slug_candidates
    [
      [:name ],
      [:name, :email],
    ]
  end

  def should_generate_new_friendly_id?
   first_name_changed? || last_name_changed?
  end

  def name
   "#{first_name} #{last_name}"
  end
  def name_reversed
   "#{last_name}, #{first_name}"
  end

  def full_name
    "#{last_name.upcase}, #{first_name}"
  end
  private
  def generate_uuid
    self.slug = SecureRandom.uuid
  end
end
