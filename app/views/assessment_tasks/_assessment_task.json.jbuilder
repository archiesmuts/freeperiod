json.extract! assessment_task, :id, :name, :slug, :assessment_type_id, :created_at, :updated_at
json.url assessment_task_url(assessment_task, format: :json)
