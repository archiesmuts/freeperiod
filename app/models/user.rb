class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable
  devise  :database_authenticatable, :registerable, :recoverable, :rememberable,
          :trackable, :validatable, :confirmable, :lockable, :timeoutable

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

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
   "#{first_name.titleize} #{last_name.titleize}"
  end
  def name_reversed
   "#{last_name.upcase}, #{first_name.titleize}"
  end

end
