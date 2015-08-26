class SeriesSmallSerializer < ActiveModel::Serializer
  attributes :id, :name, :season, :finished
end
