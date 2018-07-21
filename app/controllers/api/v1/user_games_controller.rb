class Api::V1::UserGamesController < ApplicationController
  def index
    @usergames = UserGame.all

    render json: @usergames
  end

  def create
    @usergame = UserGame.create(user_game_params)
  end

  def show
    @usergame = UserGame.find(params[:id])
    render json: @usergame
  end

  private

  def user_game_params
    params.require(:user).permit(:score, :date)
  end
end
