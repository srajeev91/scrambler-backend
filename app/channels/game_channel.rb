class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "game_channel"
  end

  # def received(data)
  #   @game = Game.find_by(id: params[:id])
  #
  #   serialized_data = ActiveModelSerializers::Adapter::Json.new(
  #       GameSerializer.new(@game)
  #   ).serializable_hash
  #
  #   GameChannel.broadcast_to("game_channel", content: serialized_data)
  # end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
