FactoryBot.define do
  factory :event do
    description {Faker::Lorem.paragraph}
    host { host_created }
    location {Faker::Lorem.sentence}
    date { Time.now - rand(80000...100000)}
  end
end
