# frozen_string_literal: true

FactoryBot.define do
  factory :player_game_stat do
    yds { rand(0.0..6000.0).round(2) }
    comp_pct { rand(0.0..100.0).round(2) }
    fgm { rand(0..10) }
    
    game
    player
  end
end