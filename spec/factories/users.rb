FactoryBot.define do
  factory :user do
    name { "#{Faker::Movies::HarryPotter.character} + #{rand(0...10) }" }
  end
end
