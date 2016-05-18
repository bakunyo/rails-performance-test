FactoryGirl.define do
  factory :post do
    association :user
    title { Faker::Lorem.word }
    body { Faker::Lorem.paragraph }
  end
end
