FactoryGirl.define do
  factory :series do
    name { Faker::Company.catch_phrase }
    season { Faker::Company.catch_phrase }
  end
end
