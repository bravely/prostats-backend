class Api::V1::TournamentsController < ApplicationController
  before_action :find_tournament, only: [:show]

  def show
    render json: @tournament, include: %w(matches games)
  end

  private

  def find_tournament
    @tournament = Tournament.find(params[:id])
  end
end
