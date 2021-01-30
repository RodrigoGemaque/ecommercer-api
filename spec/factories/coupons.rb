FactoryBot.define do
  factory :coupon do
    code { Faker::Commerce.unique.promotion_code(digits: 6) }
    status { %i(active inactive).sample}
    discount_value { rand(1..99) }
    duedate { "2021-01-29 23:16:33" }
  end
end
