class MatchSmallSerializer < ActiveModel::Serializer
  attributes :id, :live, :finished, :name, :played_at, :max_games
end
