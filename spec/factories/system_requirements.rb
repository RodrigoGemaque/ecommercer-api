FactoryBot.define do
  factory :system_requirement do
    sequence(:name) { |n| "Basic #{n}" }
    operational_system { Faker::Computer.os }
    video_board { "N/A" }
    storage { "500GB" }
    processor { "Amd Rizen 7" }
    memory { "8 GB" }
    video_board { "Geforce 1660" }
  end
end
