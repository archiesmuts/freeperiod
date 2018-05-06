class PayAgreement < ApplicationRecord
  resourcify
  extend FriendlyId
  friendly_id :year_user_name, use: :slugged
  belongs_to :fee, inverse_of: :pay_agreements
  belongs_to :user_registration, inverse_of: :pay_agreements
  validates :fee_id, :user_registration_id, :discount,:discount_in_percent, :slug, presence: true
  validates :comment, presence: true, on: :update, if: :discounted?

  scope :discounted, -> { where("discount > 0")  }

  def discounted?
    discount > 0
  end

  def year_user_name
    "#{fee_year} #{student_name}"
  end

  def fee_year
    self.fee.year.strftime("%Y")
  end
  def student_name
    self.user_registration.user_name
  end
  def discount_amount
    approved_school_fee - agreed_school_fee 
  end
  def agreed_school_fee
   approved_school_fee-(approved_school_fee*discount)
 end

 def approved_school_fee
   fee.amount
 end


 def discount_in_percent
   discount.to_d*100 if discount
 end

 def discount_in_percent=(percent)
   self.discount = percent.to_d/100 if percent.present?
 end
end
