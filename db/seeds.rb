# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

32.times do
  Team.create(name: FFaker::AnimalUS.common_name.pluralize)
end

Team.all.each do |team|
  48.times do
    Player.create(last_name: FFaker::Name.last_name, team_id: team.id)
  end
end

Team.all.pluck(:id).combination(2).each do |team_1_id, team_2_id|
  game = Game.create(date: FFaker::Time.datetime)
  team_1 = Team.find(team_1_id)
  team_2 = Team.find(team_2_id)
  team_1.players.limit(11).each do |player|
    
    PlayerGameStat.create(
      game: game,
      player: player,
      yds: rand(0.0..6000.0).round(2),
      comp_pct: rand(0.0..100.0).round(2),
      fgm: rand(0..10))
  end
  
  team_2.players.limit(11).each do |player|
    PlayerGameStat.create(
      game: game,
      player: player,
      yds: rand(0.0..6000.0).round(2),
      comp_pct: rand(0.0..100.0).round(2),
      fgm: rand(0..10))
  end
end

