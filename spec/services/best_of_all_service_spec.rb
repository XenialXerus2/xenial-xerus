require 'rails_helper'

RSpec.describe BestOfAllService do
  describe '#call' do  
    it 'finds the best player by the score' do
      @player_1 = FactoryBot.create(:player)
      @player_2 = FactoryBot.create(:player)
      
      FactoryBot.create(:player_game_stat, player: @player_1, yds: 1000000)

      expect(BestOfAllService.new(:yds, 1).call).to eq([@player_1])
    end
    
    it 'finds the best players by the score' do
      5.times do
        FactoryBot.create(:player_game_stat, fgm: rand(2..10))
      end

      @player = FactoryBot.create(:player_game_stat, fgm: 1).player
      
      expect(BestOfAllService.new(:fgm).call).not_to include(@player)
    end
  end
end