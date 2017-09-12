json.extract! course, :id, :name, :grade_id, :subject_id, :type, :created_at, :updated_at
json.url course_url(course, format: :json)
