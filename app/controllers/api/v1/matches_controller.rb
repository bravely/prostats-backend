class Api::V1::MatchesController < ApplicationController
  before_action :find_match, only: [:show]

  def show
    render json: @match, include: %w(games blue_team red_team)
  end

  private

  def find_match
    @match = Match.find(params[:id])
  end
end
