class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :home_team_id, index: true, foreign_key: true, null: false
      t.integer :away_team_id, index: true, foreign_key: true, null: false
      t.datetime :date
      
      
      t.timestamps
    end
  end
end
