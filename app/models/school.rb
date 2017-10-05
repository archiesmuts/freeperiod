class School < ApplicationRecord
  resourcify
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :memberships, inverse_of: :school, dependent: :destroy
  has_many :users, -> { order("last_name, first_name")}, through: :memberships
  has_many :registration_klasses
  has_many :user_registrations, through: :registration_klasses

  validates :name, :slug, presence: true
  validates_associated :memberships
  validates_associated :registration_klasses
  # validates :name, unique: true

  def should_generate_new_friendly_id?
    name_changed?
  end

end
