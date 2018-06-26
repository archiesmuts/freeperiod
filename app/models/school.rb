class School < ApplicationRecord
  resourcify
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :memberships, inverse_of: :school, dependent: :destroy
  has_many :users, -> { order("last_name, first_name")}, through: :memberships
  has_many :registration_klasses, -> { includes(:course).order("year DESC").limit(50).order("courses.name ASC") }, inverse_of: :school
  has_many :user_registrations, through: :registration_klasses
  has_many :events, inverse_of: :school
  has_many :fees, inverse_of: :school
  has_many :addresses, as: :addressable
  has_many :goals, as: :goalable
  has_many :achievements, -> { order('date DESC') }, as: :achievable

  validates :name, :slug, presence: true
  validates :name, uniqueness: true
  validates_associated :memberships
  validates_associated :registration_klasses
  # validates :name, unique: true

  jsonb_accessor :prospectus,
    emis_no: :string,
    sector: :string,
    phase: :string,
    specialization: [:string, array: true, default: []],
    sport: [:string, array: true, default: []]

  jsonb_accessor :preferences,
    no_of_terms: :integer


  def should_generate_new_friendly_id?
    name_changed?
  end

end
