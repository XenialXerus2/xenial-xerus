# frozen_string_literal: true

class Game < ApplicationRecord
  has_many :player_game_stats
  has_many :players, through: :player_game_stats 
end
