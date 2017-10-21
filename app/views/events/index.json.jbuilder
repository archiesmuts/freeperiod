# json.array! @school.events, partial: 'events/event', as: :event
json.array!(@school.events) do |event|
  # json.school do |json|
  #   json.(event.school, :id, :title)
  #   json.url school_url(event.school)
  # end
  json.extract! event, :id, :school_id, :title, :description
  json.start event.start_time
  json.end event.end_time
  json.url school_event_url(event.school, event, format: :html)
end
