json.extract! user_registration, :id, :user_registration_klass_id, :user_type, :completed, :completed_at, :created_at, :updated_at
json.url user_registration_url(user_registration, format: :json)
