json.extract! lesson_plan, :id, :name, :registration_klass_id, :term, :created_at, :updated_at
json.url lesson_plan_url(lesson_plan, format: :json)
