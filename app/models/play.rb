class Play < ActiveRecord::Base
  belongs_to :player
  belongs_to :game
  belongs_to :team

  validates :player, presence: true
  validates :game, presence: true

  before_create :set_team

  # Note that Play#harvest REQUIRES an API object. This is
  # because there is no API endpoint for this- it is part of
  # the LolesportsApi::Game object.
  # rubocop:disable Metrics/AbcSize
  def harvest(api_play, additional_values)
    the_player = Player.find_by(lolesports_id: api_play.player_id)
    the_player = Player.new(lolesports_id: api_play.player_id).harvest unless the_player
    update_hash = {
      kills: api_play.kills,
      deaths: api_play.deaths,
      assists: api_play.assists,
      kda: api_play.kda,
      champion_id: api_play.champion_id,
      end_level: api_play.end_level,
      total_gold: api_play.total_gold,
      minions_killed: api_play.minions_killed,
      first_spell: api_play.spell0,
      second_spell: api_play.spell1,
      player: the_player,
      team: Team.find_by(lolesports_id: api_play.team_id)
    }
    api_play.items.each_with_index { |item_id, i| update_hash["item#{i}".to_sym] = item_id }
    update! update_hash.merge!(additional_values)
    self
  end
  # rubocop:enable Metrics/AbcSize

  private

  def set_team
    self.team ||= player.team
  end
end
