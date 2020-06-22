FactoryBot.define do
  factory :event do
    description { Faker::Lorem.paragraph }
    host { nil }
    location { Faker::Lorem.sentence }
    date { Time.now - rand(-100_000...100_000) }
  end
end
