class GameSmallSerializer < ActiveModel::Serializer
  cache key: 'games_small', expires_in: 1.hour
  attributes :id, :played_at, :notes, :game_length, :game_number, :youtube_url
end
