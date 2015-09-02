class Api::V1::MatchesController < ApplicationController
  before_action :find_match, only: [:show]

  def index
    @matches = Match.where(match_params)
               .order(played_at: :desc)
               .includes(:tournament, :blue_team, :red_team, :winner, :games)
               .page(params[:page])
               .per(params[:limit] || 10)

    @matches = @matches.with_team(team_param) if team_param

    render json: @matches,
      include: %w(tournaments, blue_team, red_team, winner, games),
      meta: { total_pages: @matches.total_pages }
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

  def team_param
    params[:team_id]
  end
end
