json.extract! event, :id, :school_id, :title, :description, :start_time, :end_time, :created_at, :updated_at
json.url school_event_url([event.school, event], format: :json)
