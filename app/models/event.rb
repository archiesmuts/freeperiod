class Event < ApplicationRecord
  resourcify
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :school, inverse_of: :events
  has_many :comments, as: :commentable
  has_many :addresses, as: :addressable

  scope :newer_than, ->(date) { where('start_time > ?', date).order("start_time") }

  validates :school_id, :title, :description, :start_time, :end_time, :slug, presence: true
  validate :start_time_cannot_be_in_the_past, :end_time_must_be_greater_than_start_time


  def school_name
    school.name if school.present?
  end

  def should_generate_new_friendly_id?
    title_changed?
  end

 def start_time_cannot_be_in_the_past
   if start_time.present? && start_time < Date.today
     errors.add(:start_time, "Start date/time can't be in the past")
   end
 end

 def end_time_must_be_greater_than_start_time
   if start_time.present? && end_time.present? && end_time < start_time
     errors.add(:end_time, "End date/time can't happen before the start date")
   end
 end

  def start_weekday
    start_time.wday
  end

  def end_weekday
    end_time.wday
  end
end
