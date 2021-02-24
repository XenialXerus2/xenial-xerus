class LastGamesAchievementService
  include ::Support::CheckAttr

  def initialize(player_id, attr, n = 5)
    @attr = check_attr(attr)
    @player = Player.find(player_id)
    @n = n
    @last_n_games = @player.team.games.order(date: :desc).distinct.limit(@n)
    
  end

  def call?
    @player_game = PlayerGameStat.where(player: @player, game_id: @last_n_games.map(&:id).compact)
                                 .order(@attr => :desc).first
                           
    score = @player_game.send(@attr)
    score.present? && score > expected_score(@attr)
  end
end