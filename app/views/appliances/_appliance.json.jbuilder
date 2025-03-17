json.extract! appliance, :id, :photo_url, :name, :address, :availability, :price, :overview, :user_id, :created_at, :updated_at
json.url appliance_url(appliance, format: :json)
