FactoryBot.define do
  factory :game do
    # mode { [:pvp, :pve, :both].sample }
    mode { %i(pve pvp both).sample }
    release_date { "2021-01-29 20:43:16" }
    developer { Faker::Company.name }
    system_requirement 
  end
end

