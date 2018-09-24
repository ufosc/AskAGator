json.extract! course, :id, :course_code, :title, :description, :professor_id_id, :created_at, :updated_at
json.url course_url(course, format: :json)
