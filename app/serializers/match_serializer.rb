class MatchSerializer < ActiveModel::Serializer
  attributes :id, :played_at, :live, :finished, :max_games, :name

  belongs_to :tournament
  belongs_to :blue_team, serializer: TeamSmallSerializer
  belongs_to :red_team, serializer: TeamSmallSerializer
  belongs_to :winner, serializer: TeamSmallSerializer
  has_many :games, serializer: GameSmallSerializer
end
