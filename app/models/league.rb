class League < ActiveRecord::Base
  has_many :teams
  has_many :tournaments
  has_many :series

  def self.harvest(lolesports_league)
    league = find_or_initialize_by(lolesports_id: lolesports_league.id)
    league.name = lolesports_league.label
    league.abbr = lolesports_league.short_name
    league.save
    league
  end
end
