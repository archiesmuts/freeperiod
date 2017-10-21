json.extract! result, :id, :student_score, :teacher_comment, :registration_id, :assessment_id, :created_at, :updated_at
json.url result_url(result, format: :json)
