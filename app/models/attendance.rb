class Attendance < ApplicationRecord
  resourcify
  belongs_to :attendable, polymorphic: true
  validates :comment, :date, presence: true
  validate :attendance_cannot_be_recorded_in_the_future

  def attendance_cannot_be_recorded_in_the_future
    if date.present? && date > Date.today
      errors.add(:date, "cannot be in the future unless you're a time traveller")
    end
  end

end
