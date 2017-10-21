json.extract! attendance, :id, :comment, :date, :attendable_id, :attendable_type, :created_at, :updated_at
json.url attendance_url(attendance, format: :json)
