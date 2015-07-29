class Play < ActiveRecord::Base
  belongs_to :player
  belongs_to :game
  belongs_to :team

  validates :player, presence: true
  validates :game, presence: true

  before_create :set_team

  private

  def set_team
    self.team ||= player.team
  end
end
