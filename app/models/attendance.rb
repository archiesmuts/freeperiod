class Attendance < ApplicationRecord

  belongs_to :attendable, polymorphic: true
  validates :comment, :date, presence: true
end
