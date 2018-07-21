class Api::V1::GamesController < ApplicationController
  def index
    @games = Game.all

    render json: @games
  end

  def create
    @game = Game.create(params[:id])
  end

end
