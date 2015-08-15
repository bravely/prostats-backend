class League < ActiveRecord::Base
  has_many :teams
  has_many :tournaments
  has_many :series
end
