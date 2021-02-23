class BestOfAllService
  include ::Support::CheckAttr

  def initialize(attr, n = 5)
    @attr = check_attr(attr)
    @n = n
  end

  def call
    PlayerGameStat.group('player_game_stats.player_id')
                  .select("player_game_stats.player_id, SUM(player_game_stats.#{@attr}) as result")
                  .order(result: :desc)
                  .limit(@n)
                  .map(&:player)
  end
end