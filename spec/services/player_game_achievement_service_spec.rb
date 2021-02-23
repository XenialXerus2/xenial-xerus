require 'rails_helper'

RSpec.describe PlayerGameAchievementService do
  describe '#call?' do  
    it 'checks if score is achieved' do  
      @player_game = FactoryBot.create(:player_game_stat, yds: 11)
      expect(PlayerGameAchievementService.new(@player_game.player.id, @player_game.game.id, :yds).call?).to eq(true)
    end
    
    it 'finds the best players by the score' do
      @player_game = FactoryBot.create(:player_game_stat, yds: 9)

      expect(PlayerGameAchievementService.new(@player_game.player.id, @player_game.game.id, :yds).call?).to eq(false)
    end
    
    it 'raises error when attribute isn\'t present' do
      @player_game = FactoryBot.create(:player_game_stat, yds: 9)

      expect { PlayerGameAchievementService.new(@player_game.player.id, @player_game.game.id, :ydss).call? }.to raise_error(RuntimeError)
    end
    
    it 'raises error when game isn\'t present' do
      @player_game = FactoryBot.create(:player_game_stat, yds: 9)

      expect { PlayerGameAchievementService.new(100, 100, :yds) }.to raise_error
    end
  end
end