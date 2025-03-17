json.extract! favourite_list, :id, :name, :description, :user_id, :created_at, :updated_at
json.url favourite_list_url(favourite_list, format: :json)
