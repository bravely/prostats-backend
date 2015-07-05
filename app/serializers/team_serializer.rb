class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :location

  belongs_to :league
  has_many :players
end
