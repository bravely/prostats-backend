class LeagueSerializer < ActiveModel::Serializer
  attributes :id, :name, :region, :abbr

  has_many :teams
end
