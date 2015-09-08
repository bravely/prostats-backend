class TeamSmallSerializer < ActiveModel::Serializer
  cache key: 'teams_small', expires_in: 1.hour
  attributes :id, :name, :location, :acronym
end
