class SeriesSerializer < ActiveModel::Serializer
  attributes :id, :name, :season, :finished

  belongs_to :league, serializer: LeagueSmallSerializer
  has_many :tournaments, serializer: TournamentSmallSerializer
end
