json.extract! product, :id, :name, :item_id, :type, :size, :created_at, :updated_at
json.url product_url(product, format: :json)
