json.extract! registration, :id, :registration_klass_id, :user_type, :completed, :completed_at, :created_at, :updated_at
json.url registration_url(registration, format: :json)
