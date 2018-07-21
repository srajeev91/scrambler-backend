class CreateGameWords < ActiveRecord::Migration[5.2]
  def change
    create_table :game_words do |t|
      t.references :word, foreign_key: true
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
