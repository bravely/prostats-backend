class Series < ActiveRecord::Base
  has_many :tournaments
  belongs_to :league

  before_save :check_if_finished

  # Note that the league object is from ActiveRecord.
  def harvest(api_series = nil, additional_values = {})
    api_series = LolesportsApi::Series.find(lolesports_id) unless api_series
    update_hash = {
      name: api_series.label
    }.merge(additional_values)
    update!(update_hash)
    self
  end

  private

  def check_if_finished
    return unless tournaments.any? && tournaments.map(&:finished?).include?(false)
    self.finished = true
  end
end
