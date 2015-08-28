class Api::V1::MatchesController < ApplicationController
  before_action :find_match, only: [:show]

  def index
    @matches = Match.where(match_params)
               .order(played_at: :desc)
               .includes(:tournament, :blue_team, :red_team, :winner, :games)
               .page(params[:page])
               .per(params[:limit] || 10)

    render json: @matches, include: %w(tournaments, blue_team, red_team, winner, games)
  end

  def show
    render json: @match, serializer: SingleMatchSerializer, include: %w(games blue_team red_team)
  end

  private

  def find_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.permit(:tournament_id, :finished)
  end
end
