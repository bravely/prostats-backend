class Team < ActiveRecord::Base
  has_many :players
  belongs_to :league
  has_many :tournaments, through: :contestants

  def harvest(api_team = nil, additional_values = {})
    api_team = LolesportsApi::Team.find(lolesports_id) unless api_team
    update_hash = {
      name: api_team.name,
      acronym: api_team.acronym
    }.merge(additional_values)
    update!(update_hash)
    self
  end

  def games
    Game.where('blue_team_id = ? OR red_team_id = ?', id, id)
  end

  def matches
    Match.where('blue_team_id = ? OR red_team_id = ?', id, id)
  end
end
