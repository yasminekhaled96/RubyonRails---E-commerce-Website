json.extract! product, :id, :title, :description, :price, :instockquantity, :category_id, :brand_id, :created_at, :updated_at
json.url product_url(product, format: :json)
