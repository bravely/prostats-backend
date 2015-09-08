class LeagueSmallSerializer < ActiveModel::Serializer
  cache key: 'leagues_small', expires_in: 1.hour
  attributes :id, :name, :region, :abbr
end
