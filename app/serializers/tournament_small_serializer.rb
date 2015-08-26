class TournamentSmallSerializer < ActiveModel::Serializer
  attributes :id, :name, :finished, :season, :starts_at, :ends_at
end
