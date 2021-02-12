json.products do
  json.arrau! @products do |product|
    json.partial! product
    json.partial! product.productable
  end
end