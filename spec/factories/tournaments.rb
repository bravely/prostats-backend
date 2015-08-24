FactoryGirl.define do
  factory :tournament do
    starts_at { Faker::Time.backward(14, :evening) }
    ends_at { starts_at + 7.days }
    name { Faker::Company.catch_phrase }
    finished { ends_at.past? }

    factory :tournament_that_finished do
      ends_at { Faker::Time.backward(14, :evening) }
      finished { true }
    end

    factory :tournament_with_matches_and_games do
      transient do
        match_count 6
      end

      after(:create) do |tournament, evaluator|
        create_list(:match_with_games, evaluator.match_count, tournament: tournament)
      end
    end
  end
end
