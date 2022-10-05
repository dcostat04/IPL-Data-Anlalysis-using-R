# Best bowler till date

dels = deliveries %>% 
  group_by(bowler) %>%
  summarize(total_runs = sum(total_runs)) %>%
  arrange(total_runs) 

print(dels, n=420)

# Worst 10 bowlers till date

dels = deliveries %>% 
  group_by(bowler) %>%
  summarize(total_runs = sum(total_runs), wickets = sum(is_wicket)) %>%
  arrange(wickets)

print(dels,n=420)

# Top 14 wicket takers over 2008-2020
deliveries %>%
  group_by(bowler) %>%
  summarize(wickets = sum(is_wicket),.groups='drop') %>%
  arrange(desc(wickets)) %>%
  top_n(14)

# Visualize the same
deliveries %>%
  group_by(bowler) %>%
  summarize(wickets = sum(is_wicket),.groups='drop') %>%
  arrange(desc(wickets)) %>%
  top_n(14) %>%
  ggplot(aes(x=wickets, y=bowler, fill=wickets)) + geom_col(position="dodge") + 
  labs(x="Number of Wickets", y="Bowler", title = "Total wickets by bowlers in IPL History")


# Powerplays in IPL
power_play <- data %>%
  group_by(over < 6)

head(power_play)
