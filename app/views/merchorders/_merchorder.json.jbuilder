json.extract! merchorder, :id, :quantity, :merchandises_id, :orders_id, :created_at, :updated_at
json.url merchorder_url(merchorder, format: :json)
