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

    factory :league_with_series_and_tournaments do
      transient do
        series_count 2
        tournament_count 8
      end

      after(:create) do |league, evaluator|
        create_list(:series, evaluator.series_count, league: league)
        create_list(:tournament, evaluator.tournament_count, league: league)
      end
    end
  end
end
