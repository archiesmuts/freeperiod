class Course < ApplicationRecord
  resourcify
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :registration_klasses
  #has_many :registrations, through: :registration_klasses
  belongs_to :grade
  belongs_to :subject

  validates :subject_id, :grade_id, :name, :subject_type, :slug, presence: true

  enum subject_type: {
    subject: 0,
    registration: 1
  }
  def should_generate_new_friendly_id?
    name_changed?
  end

end
