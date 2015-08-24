class LeagueSerializer < ActiveModel::Serializer
  attributes :id, :name, :region, :abbr

  has_many :series
  # has_many :tournaments
end
