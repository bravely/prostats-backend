FactoryGirl.define do
  factory :player do
    handle { Faker::Internet.user_name }
    real_name { Faker::Name.name }
    position [nil, 'top', 'jungle', 'middle', 'marksman', 'support'].sample
    season_wins 2
    season_losses 1

    factory :player_with_team do
      team
    end
  end
end
