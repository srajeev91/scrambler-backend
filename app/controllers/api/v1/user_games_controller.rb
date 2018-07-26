class Api::V1::UserGamesController < ApplicationController
  # def index
  #   @usergames = UserGame.all
  #
  #   render json: @usergames
  # end

  def show
    @usergame = UserGame.find(params[:id])
    render json: @usergame
  end

  def highscores
    sortedGames = UserGame.all.sort_by do |user_game|
      user_game[:score]
    end

    sortedGames = sortedGames.last(10).reverse

    render json: sortedGames
  end

  def update
    user_id = params[:user_id]
    score = params[:score]
    game_id = params[:game_id]
    @usergame = UserGame.find_by(user_id: user_id, game_id: game_id)
    @usergame.update(user_game_params)
  end

  private

  def user_game_params
    params.require(:user_game).permit(:score, :user_id, :game_id)
  end

end
