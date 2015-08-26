class GameSerializer < ActiveModel::Serializer
  cache key: 'game', expires_in: 3.hours

  attributes :id, :notes, :played_at, :game_length, :game_number, :youtube_url

  belongs_to :blue_team, serializer: TeamSmallSerializer
  belongs_to :red_team, serializer: TeamSmallSerializer
  belongs_to :winner, serializer: TeamSmallSerializer
  belongs_to :match
  has_many :players, serializer: PlayerSmallSerializer
  has_many :plays, serializer: PlaySmallSerializer
end
