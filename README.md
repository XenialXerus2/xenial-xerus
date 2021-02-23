# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version -- 3.0.0

* Postgresql

* Basic flow

If you prefer rvm:  
`source ~/.rvm/scripts/rvm`
`rvm use 3.0.0@xenial --create`
`bundle`
`rake db:create && rake db:migrate && rake db:seed`
`rails c`

``` ruby
  # attr could be :yds, :comp_pct, :fgm
  BestOfAllService.new(attr, n).call
  # n -- integer means how many players we'll have returned
  
  BestOfTeamService.new(attr, team_id, n).call
  
  LastGamesAchievementService.new(player_id, attr, n = 5).call?
  # n -- integer, last games count
  PlayerGameAchievementService.new(player_id, game_id, attr).call?
```

* Глоссарий
yds - rushing yards - Количество ярдов, которое пробежал игрок во время атаки  
comp_pct - completion percentage - Процент успешных передач (точность передач)  
fgm - final goals made - Количество успешно забитых голов  
