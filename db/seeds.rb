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

Team.all.combination(2).each do |team_1, team_2|
  Game.create(home_team: team_1, away_team: team_2, date: FFaker::Time.datetime)
end