class Api::V1::GamesController < ApplicationController
  before_action :requires_login, only: [:index]

  def index
    @games = Game.all

    render json: @games
  end

  def create
    @game = Game.create()
    game_id = @game.id
    user_id = params[:user_id]
    score = params[:score]
    date = params[:date]
    UserGame.create(user_id: user_id, game_id: game_id, score: score, date: date)
    render json: @game
  end

end
