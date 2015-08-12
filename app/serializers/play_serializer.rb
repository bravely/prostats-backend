class PlaySerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :player
  belongs_to :game
  belongs_to :team
end
