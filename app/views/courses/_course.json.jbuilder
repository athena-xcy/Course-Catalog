json.extract! course, :id, :name, :code, :credits, :description, :independent_study, :created_at, :updated_at
json.url course_url(course, format: :json)
