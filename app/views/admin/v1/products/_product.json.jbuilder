json.(product, :id, :name, :description, :price, :status)
json.image_url rails_blob_url(product.image)
json.productable product.productable_type_underscore
json.categories product.categories.pluck(:name)# esse metodo pluck pega o nome o restante do record ele nao inseri
