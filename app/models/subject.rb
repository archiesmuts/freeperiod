class Subject < ApplicationRecord
  resourcify
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, :slug, presence: true

  def should_generate_new_friendly_id?
    name_changed?
  end
end
