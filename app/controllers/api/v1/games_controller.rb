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

    serialized_data = ActiveModelSerializers::Adapter::Json.new(
        GameSerializer.new(@game)
    ).serializable_hash

    ActionCable.server.broadcast 'game_channel', content: serialized_data


    render json: @game
  end

  # def update
  #   @game = Game.find_by(id: params[:id])
  #
  #   serialized_data = ActiveModelSerializers::Adapter::Json.new(
  #       GameSerializer.new(@game)
  #   ).serializable_hash
  #
  #   ActionCable.server.broadcast 'game_channel', content: serialized_data
  #
  # end

end
