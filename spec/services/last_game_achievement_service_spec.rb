require 'rails_helper'

RSpec.describe LastGamesAchievementService do
  describe '#call?' do  
    it 'checks if score is achieved in last n games of the team' do 
      team_1 = FactoryBot.create(:team)
      team_2 = FactoryBot.create(:team)
      player_2 = FactoryBot.create(:player, team: team_2)

      4.times do
        player = FactoryBot.create(:player, team: team_1)
        FactoryBot.create(:player_game_stat, yds: 0, player: player)
      end
      
      player_game = FactoryBot.create(:player_game_stat, yds: 1000000, player: player_2)

      expect(LastGamesAchievementService.new(team_1.players.first.id, :yds).call?).to eq(false)
      expect(LastGamesAchievementService.new(player_2.id, :yds).call?).to eq(true)
    end
    
    it 'raises error when attribute isn\'t present' do
      expect { LastGamesAchievementService.new(1, :unknown_attribute).call? }.to raise_error(RuntimeError)
    end
  end
end