require 'rails_helper'

RSpec.describe BestOfTeamService do
  describe '#call' do  
    it 'finds the best player by the score' do
      team = FactoryBot.create(:team)
      @player_1 = FactoryBot.create(:player, team: team)
      @player_2 = FactoryBot.create(:player, team: team)
      @player_other_team = FactoryBot.create(:player)
      
      FactoryBot.create(:player_game_stat, player: @player_other_team, yds: 1000000)
      FactoryBot.create(:player_game_stat, player: @player_2, yds: 1000000)

      expect(BestOfTeamService.new(:yds, team.id, 1).call).not_to include(@player_other_team)
      expect(BestOfTeamService.new(:yds, team.id, 1).call).to eq([@player_2])
    end
    
    it 'throws error with wrong attribute' do
      expect { BestOfTeamService.new('%SELECT * FROM user_admins%', 1, 1).call }.to raise_error(RuntimeError)
    end
  end
end