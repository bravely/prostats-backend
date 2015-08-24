class GameSmallSerializer < ActiveModel::Serializer
  attributes :id, :played_at, :notes, :game_length, :game_number, :youtube_url
end
