class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :location

  belongs_to :league
  has_many :players, serializer: PlayerSmallSerializer
  # has_many :matches
end
