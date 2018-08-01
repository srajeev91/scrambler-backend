class WordChannel < ApplicationCable::Channel
  def subscribed
    stream_from "word_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
