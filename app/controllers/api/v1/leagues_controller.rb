class Api::V1::LeaguesController < ApplicationController
  before_action :find_league, only: [:show]

  def index
    @leagues = League.all.includes(:series, :tournaments)

    render json: @leagues, include: %w(series, tournaments)
  end

  def show
    render json: @league, include: %w(series tournaments)
  end

  private

  def find_league
    @league = League.find(params[:id])
  end
end
