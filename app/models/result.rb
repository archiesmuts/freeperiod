class Result < ApplicationRecord
  resourcify
  belongs_to :assessment, inverse_of: :results
  belongs_to :user_registration, inverse_of: :results
  has_many :comments, as: :commentable

  validates :assessment_id, :user_registration_id, :student_score, presence: true
  validates :teacher_comment, presence: true, on: :update, if: :learner_has_score
  validates :student_score, numericality: { greater_than_or_equal_to: 0 }

  def percent_mark
    student_score / assessment_value * 100
  end

  def assessment_value
    self.assessment.value
  end

  def learner_has_score
    student_score > 0
  end
end
