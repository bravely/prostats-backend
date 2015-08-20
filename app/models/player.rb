class Player < ActiveRecord::Base
  enum position: {
    top: 0,
    jungle: 1,
    middle: 2,
    marksman: 3,
    support: 4
  }

  LOLESPORTS_ROLE = {
    'Top Lane' => :top,
    'Jungler' => :jungle,
    'Mid Lane' => :middle,
    'AD Carry' => :marksman,
    'Support' => :support
  }

  default_scope { order('handle ASC') }
  belongs_to :team
  has_many :plays
  has_many :games, through: :plays

  def self.harvest(lolesports_player)
    find_or_initialize_by(lolesports_id: lolesports_player.id) do |player|
      player.handle = lolesports_player.name
      player.first_name = lolesports_player.first_name
      player.last_name = lolesports_player.last_name
      player.hometown = lolesports_player.hometown
      # player.contract_expires_at = lolesports_player.contract_expires_at
      player.residency = lolesports_player.residency

      player.starter = lolesports_player.is_starter == 1 ? true : false
      player.position = LOLESPORTS_ROLE[lolesports_player.role]
      player.save
    end
  end
end
