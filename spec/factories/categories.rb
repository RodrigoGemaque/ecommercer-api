FactoryBot.define do
  factory :category do
   sequence(:name){ |n|"Category" }
  end
end
