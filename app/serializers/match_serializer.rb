class MatchSerializer < ActiveModel::Serializer
  attributes :id, :played_at, :live, :finished, :max_games, :name

  belongs_to :tournament
  belongs_to :blue_team
  belongs_to :red_team
  belongs_to :winner
end
