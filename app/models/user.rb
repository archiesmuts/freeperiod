class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :omniauthable
  devise  :database_authenticatable, :registerable, :recoverable, :rememberable,
          :trackable, :validatable, :confirmable, :lockable, :timeoutable, :invitable

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  has_many :memberships, dependent: :destroy
  has_many :schools, through: :memberships
  has_many :registrations
  has_many :registration_klasses, through: :registrations

  validates :first_name, :last_name, :slug, presence: true
  validates :terms_of_privacy_statement, acceptance: true
  # scope :faculty, -> { includes(:roles).where(roles: { name: "faculty"}).order("users.last_name ASC, users.first_name ASC")}

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
    "#{last_name}, #{first_name}"
  end

end
