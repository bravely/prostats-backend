class SeriesSmallSerializer < ActiveModel::Serializer
  cache key: 'series_small', expires_in: 1.hour
  attributes :id, :name, :season, :finished
end
