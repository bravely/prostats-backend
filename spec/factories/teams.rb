FactoryGirl.define do
  factory :team do
    name { Faker::Team.name }
    location { Faker::Address.country }

    factory :team_with_players do
      transient do
        player_count 5
      end

      after(:create) do |team, evaluator|
        create_list(:player, evaluator.player_count, team: team)
      end

      factory :team_with_players_and_league do
        league
      end
    end
  end
end
