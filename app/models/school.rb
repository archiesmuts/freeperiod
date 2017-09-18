class School < ApplicationRecord
  resourcify
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :registration_klasses
  #has_many :registrations, through: :registration_klasses

  validates :name, :slug, presence: true

  def should_generate_new_friendly_id?
    name_changed?
  end

end
