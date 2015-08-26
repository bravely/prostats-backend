class MatchSmallSerializer < ActiveModel::Serializer
  attributes :id, :live, :finished, :name, :played_at, :max_games

  belongs_to :tournament, serializer: TournamentSmallSerializer
  belongs_to :blue_team, serializer: TeamSmallSerializer
  belongs_to :red_team, serializer: TeamSmallSerializer
  belongs_to :winner, serializer: TeamSmallSerializer
end
