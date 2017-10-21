json.extract! pay_agreement, :id, :fee_id, :user_registration_id, :discount, :comment, :created_at, :updated_at
json.url pay_agreement_url(pay_agreement, format: :json)
