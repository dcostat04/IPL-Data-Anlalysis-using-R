# Execute this line first

matches$day <- format(as.Date(matches$date,"%Y-%m-%d"), "%d")
matches$month <- format(as.Date(matches$date,"%Y-%m-%d"), "%m")
matches$year <- format(as.Date(matches$date,"%Y-%m-%d"), "%Y")


# Number of seasons played
season_count <- length(unique(matches$year))
season_count

# Which teams won by wickets and runs
runs <- matches %>% filter(result == "runs") %>%
  select('winner', 'result', 'team1','team2' )

runs
count(runs)

wickets <- matches %>% filter(result == "wickets") %>%
  select('winner', 'result')

wickets
count(wickets)

# Plot the number of matches per season
matches %>% 
  group_by(year) %>%
  summarize(number_of_matches=n(),.groups='drop') 


matches %>% 
  group_by(year) %>%
  summarize(number_of_matches=n(),.groups='drop') %>%
  ggplot(aes(x=year, y= number_of_matches, fill=year)) + geom_bar(stat = "identity") +
  labs(x="Season",y="Number ff Matches", title ="Season wise number of matches")

# Teams Performance in IPL

matches[matches =="Rising Pune Supergiant"]<-"Rising Pune Supergiants" #cleaning data errors
matches %>% 
  filter(result != 'No result') %>%
  group_by(winner) %>%
  summarize(wins = n(),.groups='drop') %>%
  arrange(desc(wins)) %>%
  top_n(14)

matches %>% 
  group_by(winner) %>%
  summarize(wins=n(),.groups='drop') %>%
  ggplot(aes(x=winner, y= wins, fill=winner)) + geom_bar(stat = "identity") +
  labs(x="Teams",y="wins", title ="Teams Performance in IPL")

# Teams unable to perform in no-home cities

matches %>% 
  filter(result != 'No result') %>%
  group_by(winner,city) %>%
  summarize(wins = n(), .groups='drop') %>%
  arrange(city)

# Top 10 Teams dominating in certain cities
matches %>% 
  filter(result != 'No result') %>%
  group_by(winner,city) %>%
  summarize(wins = n(),.groups='drop') %>%
  arrange(desc(wins)) %>%
  top_n(10)


# Chennai Super Kings Season wise performance
matches %>% 
  filter(winner == "Chennai Super Kings")
  group_by(year) %>%
  summarize(number_of_matches=n(),.groups='drop') 


matches %>% 
  filter(winner == "Chennai Super Kings")%>%
  group_by(year) %>%
  summarize(wins=n(),.groups='drop') %>%
  ggplot(aes(x=year, y= factor(wins), fill=year)) + geom_bar(stat = "identity") +
  labs(x="year",y="wins", title ="Chennai Super Kings Performances")

# Mumbai Indians Season Wise Performance 
matches %>% 
  filter(winner == "Mumbai Indians")
  group_by(year) %>%
  summarize(number_of_matches=n(),.groups='drop') 


matches %>% 
  filter(winner == "Mumbai Indians")%>%
  group_by(year) %>%
  summarize(wins=n(),.groups='drop') %>%
  ggplot(aes(x=year, y= factor(wins), fill=year)) + geom_bar(stat = "identity") +
  labs(x="year",y="wins", title ="Mumbai Indians Performances")
  
# Chennai Super Kings IPL Performance vs Mumbai Indians 
matches %>% 
  filter(team1 == "Mumbai Indians" & team2=="Chennai Super Kings" | team1 == "Chennai Super Kings" & team2=="Mumbai Indians" & winner=="Chennai Super Kings")%>%
  group_by(year) %>%
  summarize(wins=n(),.groups='drop') %>%
  ggplot(aes(x=year, y= factor(wins), fill=year)) + geom_bar(stat = "identity") +
  labs(x="year",y="wins", title ="Chennai Super Kings IPL Performance vs Mumbai Indians ")

# Mumbai Indians IPL Performance vs Chennai Super Kings 
matches %>% 
  filter(team1 == "Mumbai Indians" & team2=="Chennai Super Kings" | team1 == "Chennai Super Kings" & team2=="Mumbai Indians" & winner=="Mumbai Indians")%>%
  group_by(year) %>%
  summarize(wins=n(),.groups='drop') %>%
  ggplot(aes(x=year, y= factor(wins), fill=year)) + geom_bar(stat = "identity") +
  labs(x="year",y="wins", title ="Mumbai Indians IPL Performance vs Chennai Super Kings ")





