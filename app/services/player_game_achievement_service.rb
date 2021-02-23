class PlayerGameAchievementService
  include ::Support::CheckAttr

  def initialize(player_id, game_id, attr)
    @attr = check_attr(attr)
    @player = Player.find(player_id)
    @game = Game.find(game_id)
    @player_game = PlayerGameStat.where(player: @player, game: @game).first
    raise "Player hasn't participated in this game" unless @player_game.present?
  end

  def call?
    score = @player_game.send(@attr)
    score.present? && score > expected_score(@attr)
  end
end