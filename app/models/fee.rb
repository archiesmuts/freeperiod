class Fee < ApplicationRecord
  resourcify
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :school, inverse_of: :fees
  has_many :pay_agreements, inverse_of: :fee
  has_many :user_registrations, through: :pay_agreements

  validates :school_id, :name, :year, :amount, :version, :details, :slug, presence: true

  jsonb_accessor :details,
    notes: :string

  enum version: {
    draft: 0,
    final: 1
  }

  def fee_and_school_name
    "#{name} #{school_name}"
  end

  def school_name
    self.school.name
  end

  def should_generate_new_friendly_id?
    name_changed?
  end
end
