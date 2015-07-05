class Api::V1::LeaguesController < ApplicationController
  before_action :find_league, only: [:show]

  def index
    @leagues = League.all

    render json: @leagues, include: ['teams']
  end

  def show
    render json: @league, include: ['teams']
  end

  private

  def find_league
    @league = League.find(params[:id])
  end
end
