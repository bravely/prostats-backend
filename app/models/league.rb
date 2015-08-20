class League < ActiveRecord::Base
  has_many :teams
  has_many :tournaments
  has_many :series

  def harvest(api_league = nil)
    api_league = LolesportsApi::League.find(lolesports_id) unless api_league
    update!(
      name: api_league.label,
      abbr: api_league.short_name
    )
    self
  end
end
