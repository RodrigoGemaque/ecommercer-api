FactoryBot.define do
  factory :licence do
    key {  Faker::Lorem.characters(number: 15) }
    game 
    user 
  end
end
