class Result < ApplicationRecord
  resourcify
  belongs_to :assessment, inverse_of: :results
  belongs_to :user_registration, inverse_of: :results
  has_many :comments, as: :commentable

  validates :assessment_id, :user_registration_id, :student_score, presence: true
  validates :teacher_comment, presence: true, on: :update
  validates :student_score, numericality: { greater_than_or_equal_to: 0 }

  def assessment_value
    self.assessment.value
  end

end
