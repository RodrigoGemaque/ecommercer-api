json.(product, :id, :name, :description, :price, :status, :featured)
json.image_url rails_blob_url(product.image)
json.productable product.productable_type.underscore
json.categories product.categories.pluck(:name)
json.productable_id product.productable_id
# esse metodo pluck pega o nome o restante do record ele nao inseri


# json.(product, :id, :name, :description, :price, :status)
# json.image_url rails_blob_url(product.image)
# json.productable product.productable_type.underscore
# # json.productable_id product.productable_id
# json.categories product.categories