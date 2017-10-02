class Result < ApplicationRecord
  resourcify

  belongs_to :assessment
  belongs_to :user_registration

  validates :assessment_id, :user_registration_id, :student_score, presence: true
  validates :teacher_comment, presence: true, on: :update
  validates :student_score, numericality: { greater_than_or_equal_to: 0 }
end
