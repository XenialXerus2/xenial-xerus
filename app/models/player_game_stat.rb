# frozen_string_literal: true

class PlayerGameStat < ApplicationRecord
  belongs_to :player
  belongs_to :game
end
