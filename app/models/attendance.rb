class Attendance < ApplicationRecord
  resourcify
  belongs_to :attendable, polymorphic: true
  validates :comment, :date, :details, presence: true
  validates :date, uniqueness: {message: "already recorded as day absent."}
  validate :attendance_cannot_be_recorded_in_the_future

  jsonb_accessor :details,
    more_information: :string

  def attendance_cannot_be_recorded_in_the_future
    if date.present? && date > Date.today
      errors.add(:date, "cannot be in the future unless you're a time traveller")
    end
  end

end
