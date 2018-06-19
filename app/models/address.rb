class Address < ApplicationRecord
  resourcify
  extend FriendlyId
  friendly_id :address, use: :slugged
  belongs_to :addressable, polymorphic: true
  validates :address, :address_type, :slug, presence: true

  enum address_type: {
    home: 0,
    work: 1,
    postal: 2
  }

end
