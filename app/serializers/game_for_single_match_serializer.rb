class GameForSingleMatchSerializer < ActiveModel::Serializer
  attributes :id, :played_at, :notes, :game_length, :game_number, :youtube_url
  belongs_to :blue_team, serializer: TeamSmallSerializer
  belongs_to :red_team, serializer: TeamSmallSerializer
  belongs_to :winner, serializer: TeamSmallSerializer
end
