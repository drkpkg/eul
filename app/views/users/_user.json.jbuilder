json.extract! user, :id, :name, :lastname, :document, :phone, :email, :password, :user_type_id, :created_at, :updated_at
json.url user_url(user, format: :json)