class Tournament < ActiveRecord::Base
  belongs_to :league
  belongs_to :series
  has_many :contestants
  has_many :teams, through: :contestants
  belongs_to :winner, class_name: 'Team'

  def harvest(api_tournament = nil, additional_values = {})
    api_tournament = LolesportsApi::Tournament.find(lolesports_id) unless api_tournament
    update_hash = {
      name: api_tournament.name_public,
      starts_at: api_tournament.date_begin,
      ends_at: api_tournament.date_end,
      finished: api_tournament.is_finished,
      season: api_tournament.season,
      winner: Team.find_by(lolesports_id: api_tournament.winner)
    }.merge(additional_values)
    update!(update_hash)
    self
  end
end
