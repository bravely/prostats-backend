class Game < ActiveRecord::Base
  has_many :plays
  has_many :players, through: :plays

  belongs_to :blue_team, class_name: 'Team'
  belongs_to :red_team, class_name: 'Team'
  belongs_to :league

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
