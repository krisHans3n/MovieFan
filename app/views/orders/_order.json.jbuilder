json.extract! order, :id, :status, :totalprice, :created_at, :updated_at
json.url order_url(order, format: :json)
