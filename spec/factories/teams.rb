FactoryGirl.define do
  factory :team do
    name { Faker::Company.name }
    location { Faker::Address.country }
  end
end
