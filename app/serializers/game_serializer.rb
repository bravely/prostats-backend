class GameSerializer < ActiveModel::Serializer
  cache key: 'game', expires_in: 3.hours
  attributes :id, :played_at, :notes, :game_length, :game_number, :youtube_url

  belongs_to :blue_team
  belongs_to :red_team
  belongs_to :winner
  belongs_to :match
  has_many :players
  has_many :plays
end
