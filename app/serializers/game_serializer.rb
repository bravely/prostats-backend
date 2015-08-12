class GameSerializer < ActiveModel::Serializer
  cache key: 'game', expires_in: 3.hours
  attributes :id, :played_at, :notes, :youtube_picks, :youtube_start,
             :twitch_picks, :twitch_start

  belongs_to :blue_team
  belongs_to :red_team
  has_many :players
  has_many :plays
end
