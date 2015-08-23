class Match < ActiveRecord::Base
  belongs_to :tournament
  belongs_to :blue_team, class_name: 'Team'
  belongs_to :red_team, class_name: 'Team'
  belongs_to :winner, class_name: 'Team'
  has_many :games

  def harvest(api_match = nil, additional_values = {})
    api_match = LolesportsApi::Match.find(lolesports_id) unless api_match
    update_hash = {
      played_at: api_match.date_time,
      live: api_match.is_live,
      finished: api_match.is_finished,
      max_games: api_match.max_games,
      name: api_match.name,
      blue_team: Team.find_by(lolesports_id: api_match.blue_team.try(:id)),
      red_team: Team.find_by(lolesports_id: api_match.red_team.try(:id)),
      winner: Team.find_by(lolesports_id: api_match.winner_id)
    }.merge(additional_values)
    update!(update_hash)
    self
  end
end
