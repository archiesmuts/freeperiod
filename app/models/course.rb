class Course < ApplicationRecord
  resourcify
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :grade
  belongs_to :subject

  validates :subject_id, :grade_id, :name, :category, :slug, presence: true

  enum category: {
    one: 0,
    two: 1
  }

end
