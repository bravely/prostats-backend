class GameSmallSerializer < ActiveModel::Serializer
  cache key: 'games_small', expires_in: 1.hour
  attributes :id, :played_at, :notes, :game_length, :game_number, :youtube_url

  belongs_to :blue_team
  belongs_to :red_team
  belongs_to :match
end
