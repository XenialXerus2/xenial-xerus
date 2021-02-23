class CreatePlayerMatchStats < ActiveRecord::Migration[6.1]
  def change
    create_table :player_match_stats do |t|
      t.belongs_to :match
      t.belongs_to :player
      t.decimal :yds
      t.decimal :comp_pct
      t.integer :fgm
      
      t.timestamps
    end
  end
end
