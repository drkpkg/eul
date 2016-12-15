json.extract! receiver, :id, :name, :phone, :address, :lat, :lon, :created_at, :updated_at
json.url receiver_url(receiver, format: :json)
