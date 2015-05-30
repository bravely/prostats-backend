class Api::V1::PlayersController < ApplicationController
  before_action :find_player, only: [:show]

  def index
    @players = Player.all

    render json: @players
  end

  def show
    render json: @player
  end

  private

  def find_player
    @player = Player.find(params[:id])
  end
end
