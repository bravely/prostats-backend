class Game < ActiveRecord::Base
  has_many :plays
  has_many :players, through: :plays

  belongs_to :blue_team, class_name: 'Team'
  belongs_to :red_team, class_name: 'Team'
  belongs_to :winner, class_name: 'Team'
  belongs_to :league
  belongs_to :match

  after_create :assign_team_players

  def blue_team_plays
    plays.where(team: blue_team)
  end

  def red_team_plays
    plays.where(team: red_team)
  end

  def blue_team_players
    players.where(id: blue_team_plays.map(&:player_id))
  end

  def red_team_players
    players.where(id: red_team_plays.map(&:player_id))
  end

  # rubocop:disable Metrics/AbcSize
  def harvest(api_game = nil, additional_values = {})
    api_game = LolesportsApi::Game.find(lolesports_id) unless api_game
    update_hash = {
      played_at: api_game.date_time,
      game_length: api_game.game_length,
      game_number: api_game.game_number,
      youtube_url: api_game.youtube_url,
      legs_url: api_game.legs_url,
      blue_team: Team.find_by(lolesports_id: api_game.blue_team.id),
      red_team: Team.find_by(lolesports_id: api_game.red_team.id),
      winner: Team.find_by(lolesports_id: api_game.winner_id)
    }.merge(additional_values)
    update!(update_hash)

    plays.destroy_all
    api_game.players.each_with_index do |api_play, i|
      plays << Play.new.harvest(api_play, game: self, position_index: i)
    end

    self
  end
  # rubocop:enable Metrics/AbcSize

  private

  def assign_team_players
    return unless players.empty?

    team_plays = []
    Player.where(team_id: [blue_team.try(:id), red_team.try(:id)]).find_each do |player|
      team_plays << plays.build(player_id: player.id, team_id: player.team_id)
    end

    transaction do
      team_plays.each(&:save)
    end
  end
end
