class Game < ApplicationRecord
  has_many :game_words
  has_many :words, through: :game_words
  has_many :user_games
  has_many :users, through: :user_games
end
