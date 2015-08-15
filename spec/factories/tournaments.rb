FactoryGirl.define do
  factory :tournament do
    starts_at { Faker::Time.backward(14, :evening) }
    ends_at { starts_at + 7.days }
    name { Faker::Company.catch_phrase }
    finished { ends_at.past? }
  end
end
