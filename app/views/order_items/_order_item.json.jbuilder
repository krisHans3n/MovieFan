json.extract! order_item, :id, :merchandises_id, :orders_id, :created_at, :updated_at
json.url order_item_url(order_item, format: :json)
