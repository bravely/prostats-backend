class Tournament < ActiveRecord::Base
  belongs_to :league
  belongs_to :series
  has_many :contestants
  has_many :teams, through: :contestants
  has_many :matches
  has_many :games, through: :matches
  belongs_to :winner, class_name: 'Team'

  scope :ordered, -> { order(last_played_at: :desc) }

  after_touch :check_latest_match

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

  private

  def check_latest_match
    self.last_played_at = Match.where(tournament_id: id, finished: true)
      .order(played_at: :desc).first.try(:played_at)
    self.save!
  end
end
