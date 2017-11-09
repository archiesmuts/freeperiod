class Achievement < ApplicationRecord
  resourcify
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :achievable, polymorphic: true
  has_many :comments, as: :commentable
  validates :title, :description, :date, :slug, presence: true

  
  def should_generate_new_friendly_id?
    title_changed?
  end
end
