class Series < ActiveRecord::Base
  has_many :tournaments
  belongs_to :league
end
