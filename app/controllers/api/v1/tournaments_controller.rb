class Api::V1::TournamentsController < ApplicationController
  before_action :find_tournament, only: [:show]

  def show
    render json: @tournament, include: %w(league series winner matches)
  end

  private

  def find_tournament
    @tournament = Tournament.find(params[:id])
  end
end
