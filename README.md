# README

### Ruby version -- 3.0.0

### Postgresql

### Basic flow

If you prefer rvm:  
`source ~/.rvm/scripts/rvm`
`rvm use 3.0.0@xenial --create`
`bundle`
`spring stop`
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

### Glossary
* yds - rushing yards - Количество ярдов, которое пробежал игрок во время атаки  
* comp_pct - completion percentage - Процент успешных передач (точность передач)  
* fgm - final goals made - Количество успешно забитых голов  

### Specs

`rspec spec/services`