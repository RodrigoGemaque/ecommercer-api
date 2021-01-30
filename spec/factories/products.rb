FactoryBot.define do
  factory :product do
    sequence(:name){ |n|"Basic#{n}" }
    description { Faker::Lorem.paragraph }
    price { Faker::Commerce.price(range: 100.0..400)}
    # OCASIONAVA ERRO ṔOR NÃO TER UM PRODUTO JÁ CRIADO
    # productable { nil }
    
    
    after :build do |product|
      product.productable = create(:game)
    end
    
  end
end