class Api::V1::GamesController < ApplicationController
  before_action :find_game, only: [:show]

  def index
    @games = Game.all

    render json: @games, include: %w(blue_team red_team)
  end

  def show
    render json: @game, include: %w(plays players blue_team red_team)
  end

  private

  def find_game
    @game = Game.find(params[:id])
  end
end
