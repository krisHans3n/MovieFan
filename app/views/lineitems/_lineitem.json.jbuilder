json.extract! lineitem, :id, :merchandises_id, :carts_id, :created_at, :updated_at
json.url lineitem_url(lineitem, format: :json)
