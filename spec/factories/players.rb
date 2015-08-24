FactoryGirl.define do
  factory :player do
    handle { Faker::Internet.user_name }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    position [nil, 'top', 'jungle', 'middle', 'marksman', 'support'].sample
    season_wins 2
    season_losses 1

    factory :player_with_team do
      team
    end

    factory :player_with_full_team do
      association :team, factory: :team_with_players, player_count: 4
    end
  end
end
