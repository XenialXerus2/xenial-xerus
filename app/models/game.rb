# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :home_team, class_name: 'Team', required: true
  belongs_to :away_team, class_name: 'Team', required: true
  
  has_many :player_game_stats 
end