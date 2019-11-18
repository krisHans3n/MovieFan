json.extract! address, :id, :street, :city, :postcode, :users_id, :created_at, :updated_at
json.url address_url(address, format: :json)
