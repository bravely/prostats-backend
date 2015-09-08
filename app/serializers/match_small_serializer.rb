class MatchSmallSerializer < ActiveModel::Serializer
  cache key: 'matches_small', expires_in: 1.hour
  attributes :id, :live, :finished, :name, :played_at, :max_games
end
