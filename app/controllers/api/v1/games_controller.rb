class Api::V1::GamesController < ApplicationController
  before_action :find_game, only: [:show]

  def show
    render json: @game, include: %w(plays players blue_team red_team)
  end

  private

  def find_game
    @game = Game.find(params[:id])
  end
end
