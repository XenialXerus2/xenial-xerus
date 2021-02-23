# frozen_string_literal: true

# yds - rushing yards
# comp_pct - completion percentage
# fgm - final goals made

class CreatePlayerGameStats < ActiveRecord::Migration[6.1]
  def change
    create_table :player_game_stats do |t|
      t.belongs_to :game
      t.belongs_to :player
      t.decimal :yds
      t.decimal :comp_pct
      t.integer :fgm

      t.timestamps
    end
  end
end
