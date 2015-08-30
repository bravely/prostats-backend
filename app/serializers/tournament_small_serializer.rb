class TournamentSmallSerializer < ActiveModel::Serializer
  cache key: 'tournaments_small', expires_in: 1.hour
  attributes :id, :name, :finished, :season, :starts_at, :ends_at, :last_played_at
end
