class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :location

  has_many :players
end
