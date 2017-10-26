class Address < ApplicationRecord
  resourcify
  belongs_to :addressable, polymorphic: true
  validates :address, :address_type, presence: true

  enum address_type: {
    home: 0,
    work: 1
  }

end
