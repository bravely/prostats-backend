class TournamentSerializer < ActiveModel::Serializer
  attributes :id, :starts_at, :ends_at, :name, :finished, :season

  belongs_to :league
  belongs_to :series
  belongs_to :winner
end
