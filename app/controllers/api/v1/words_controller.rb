class Api::V1::WordsController < ApplicationController
  def index
    @words = Word.all

    render json: @words
  end

  def create
    @word = Word.create(word_params)
  end

  def show
    @word = Word.find(params[:id])
    render json: @word
  end

  private

  def word_params
    params.require(:word).permit(:word, :length, :frequency)
  end
end
