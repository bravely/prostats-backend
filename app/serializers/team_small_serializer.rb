class TeamSmallSerializer < ActiveModel::Serializer
  cache key: 'team_small', expires_in: 1.hour
  attributes :id, :name, :location
end
