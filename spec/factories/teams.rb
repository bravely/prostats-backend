FactoryGirl.define do
  factory :team do
    name { Faker::Company.name }
    location { Faker::Address.country }

    factory :team_with_players do
      transient do
        player_count 5
      end

      after(:create) do |team, evaluator|
        create_list(:player, evaluator.player_count, team: team)
      end
    end
  end
end
