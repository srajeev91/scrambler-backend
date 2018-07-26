class ActualChangeDateToBeStringInUserGames < ActiveRecord::Migration[5.2]
  def change
    change_column :user_games, :date, :string
  end
end
