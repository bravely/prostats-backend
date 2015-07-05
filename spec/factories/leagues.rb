FactoryGirl.define do
  factory :league do
    name { Faker::Company.name }
    region { Faker::Address.country }
    abbr { Faker::Hacker.abbreviation }

    factory :league_with_teams do
      transient do
        team_count 3
      end

      after(:create) do |league, evaluator|
        create_list(:team, evaluator.team_count, league: league)
      end
    end
  end
end
