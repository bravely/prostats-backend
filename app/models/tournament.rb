class Tournament < ActiveRecord::Base
  belongs_to :league
  belongs_to :series
end
