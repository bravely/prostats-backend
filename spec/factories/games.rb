FactoryGirl.define do
  factory :game do
    played_at { Faker::Date.backward(14) }
    notes { Faker::Lorem.paragraph }
    youtube_picks { Faker::Internet.url('youtube.com') }
    youtube_start { Faker::Internet.url('youtube.com') }
    twitch_picks { Faker::Internet.url('twitch.tv') }
    twitch_start { Faker::Internet.url('twitch.tv') }

    factory :game_with_teams do
      association :blue_team, factory: :team
      association :red_team, factory: :team
    end
  end
end
