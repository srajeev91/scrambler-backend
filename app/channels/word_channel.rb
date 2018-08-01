class WordChannel < ApplicationCable::Channel
  def subscribed
    stream_from "word_channel"
  end

  def received(data)
    puts data
    puts params
    @word = Word.find_by(id: params[:id])

    # serialized_data = ActiveModelSerializers::Adapter::Json.new(
    #     GameSerializer.new(@game)
    # ).serializable_hash

    WordChannel.broadcast_to("game_channel", {word: @word.word})
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end
end
