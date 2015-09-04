class Api::V1::GamesController < ApplicationController
  before_action :find_game, only: [:show]

  def index
    @games = Game.where(game_params)
             .order(played_at: :desc)
             .includes(:plays, :players, :blue_team, :red_team)
             .page(params[:page])
             .per(params[:limit] || 10)

    @games = @games.with_player(player_param) if player_param

    render json: @games,
           include: %w(plays players blue_team red_team winner),
           meta: { total_pages: @games.total_pages }
  end

  def show
    render json: @game, include: %w(plays players blue_team red_team)
  end

  private

  def find_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.permit(:match_id, :finished)
  end

  def player_param
    params[:player_id]
  end
end
