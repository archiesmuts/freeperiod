class Part < ApplicationRecord
  resourcify
  belongs_to :assessment, inverse_of: :parts

  validates :assessment_id, :name, :description, :value, presence: true
  validates :value, numericality: { greater_than_or_equal_to: 0 }

end
