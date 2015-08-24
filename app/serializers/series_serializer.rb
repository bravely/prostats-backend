class SeriesSerializer < ActiveModel::Serializer
  attributes :id, :name, :season, :finished

  has_many :tournaments
end
