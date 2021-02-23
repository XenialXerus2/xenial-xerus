class BestOfTeamService
  include ::Support::CheckAttr

  def initialize(attr, n = 5, team_id)
    @attr = check_attr(attr)
    @team = Team.find(team_id)
    @n = n
  end

  def call
    player_ids = @team.players.pluck(:id)
    PlayerGameStat.where(player_id: player_ids)
                  .group('player_game_stats.player_id')
                  .select("player_game_stats.player_id, SUM(player_game_stats.#{@attr}) as result")
                  .order(result: :desc)
                  .limit(@n)
                  .map(&:player)
  end
end