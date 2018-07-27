json.extract! user, :id, :name, :aadhar, :created_at, :updated_at
json.url user_url(user, format: :json)
