FactoryGirl.define do
  factory :match do
    played_at { Faker::Time.backward(14, :evening) }
    live { played_at.today? }
    finished { played_at.past? }
    max_games { rand(1..5) }
    name { Faker::App.name }
    # winner_id 1

    factory :match_with_winner do
      association :winner, factory: :team
    end

    factory :match_with_games do
      transient do
        games_count 5
      end

      after(:create) do |match, evaluator|
        create_list(:game, evaluator.games_count, match: match)
      end
    end
  end
end
