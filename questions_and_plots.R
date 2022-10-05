## Plotting

## Plot the team winning most number of matches

matches %>% 
  group_by(winner) %>%
  summarize(wins = n(), .groups= 'drop') %>%
  ggplot(aes(x=wins, y=winner, fill=winner)) + geom_col(position="dodge") + 
  labs(x="Number of Wins", y="Team", title = "Number  of Matches by Team")

## Same data in console

result = matches %>% 
  group_by(winner) %>%
  summarize(wins = n() , .groups = 'drop')

result

## Man of the match awards

res = matches %>% 
  group_by(player_of_match) %>%
  summarize(awards = n())

print(res,n = 224)


## Top 10 man of the match players

matches %>% 
  group_by(player_of_match) %>%
  summarize(awards = n()) %>%
  top_n(10)

## Plot the above query
matches %>% 
  group_by(player_of_match) %>%
  summarize(awards = n()) %>% 
  top_n(10) %>%
  ggplot(aes(x = player_of_match, y=awards, fill=player_of_match)) + geom_col(position="dodge") +
  labs(x="Player_of_match", y = "Awards" , title = "Top 10 Player Man of the Match") + coord_flip()
