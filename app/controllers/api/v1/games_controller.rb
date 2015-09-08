class Api::V1::GamesController < ApplicationController
  before_action :find_game, only: [:show]

  def index
    @games = Game.where(game_params)
             .order(played_at: :desc)
             .page(params[:page])
             .per(params[:limit] || 5)

    @games = @games.with_player(player_param) if player_param

    render json: @games,
           each_serializer: GameSmallSerializer,
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
    params.permit(:match_id)
  end

  def player_param
    params[:player_id]
  end
end
