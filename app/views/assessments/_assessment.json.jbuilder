json.extract! assessment, :id, :name, :lesson_plan_id, :assessment_type, :created_at, :updated_at
json.url assessment_url(assessment, format: :json)
