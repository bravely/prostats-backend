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

  belongs_to :team
  has_many :plays
  has_many :games, through: :plays

  def harvest(api_player = nil, additional_values = {})
    api_player = LolesportsApi::Player.find(lolesports_id) unless api_player
    update_hash = {
      handle: api_player.name,
      first_name: api_player.first_name,
      last_name: api_player.last_name,
      hometown: api_player.hometown,
      contract_expires_at: api_player.contract_expiration,
      residency: api_player.residency,

      starter: (api_player.is_starter == 1 ? true : false),
      position: LOLESPORTS_ROLE[api_player.role]
    }.merge(additional_values)
    update!(update_hash)
    self
  end
end
