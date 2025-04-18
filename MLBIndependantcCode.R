```{r}

batted_balls %>% 
  filter(pitch_name == "Changeup") %>%
  head()


batted_balls %>%
  filter((bearing == "center") & (launch_speed > 100)) %>%
  head()

batted_balls %>% 
  select(batter_team, bb_type, bearing, inning, pitch_mph, launch_speed, launch_angle, is_home_run) %>%
  head()

batted_balls %>%
  select(-bip_id,-batter_id, -pitcher_id) %>%
  head()



batted_balls %>%
  select(batter_name, pitcher_name, bb_type, is_home_run, everything()) %>%
  head()




```

```{r}
batted_balls %>%
  filter(home_team == "BOS") %>%
  select(away_team, batter_team, batter_name, pitcher_name, bb_type, bearing, pitch_name, is_home_run) %>%
  head()
```

```{r}
batted_balls %>%
  count(batter_team) %>%
  head()


```

```{r}

batted_balls %>%
  count(batter_team) %>%
  arrange(-n) %>%
  head(10)
```

```{r}
batted_balls %>%
  filter(outs_when_up == 2) %>%
  count(home_team, pitch_name) %>%
  head(10)
```

```{r}

batted_balls %>% 
  filter(home_team == "BOS") %>%
  count(bearing) %>%
  head(10)

```

```{r}

batted_balls %>%
  summarize(median_launch_speed = median(launch_speed))


```

```{r}
batted_balls %>%
  filter(!is.na(launch_speed)) %>%
  summarize(median_launch_speed = median(launch_speed))


batted_balls %>%
  summarize(median_launch_speed = median(launch_speed, na.rm = TRUE))



batted_balls %>% 
  summarize(mean_pitch_mph = mean(pitch_mph, na.rm = TRUE), 
            std_deviation_pitch_mph = sd(pitch_mph, na.rm = TRUE), 
            mean_launch_speed = mean(launch_speed, na.rm = TRUE), 
            std_deviation_launch_speed = sd(launch_speed, na.rm = TRUE))



batted_balls %>% 
  group_by(pitch_name) %>%
  summarize(mean_pitch_mph = mean(pitch_mph, na.rm = TRUE), 
            std_deviation_pitch_mph = sd(pitch_mph, na.rm = TRUE), 
            mean_launch_speed = mean(launch_speed, na.rm = TRUE), 
            std_deviation_launch_speed = sd(launch_speed, na.rm = TRUE))


batted_balls %>% 
  group_by(pitch_name) %>%
  summarize(mean_pitch_mph = mean(pitch_mph, na.rm = TRUE), 
            std_deviation_pitch_mph = sd(pitch_mph, na.rm = TRUE), 
            mean_launch_speed = mean(launch_speed, na.rm = TRUE), 
            std_deviation_launch_speed = sd(launch_speed, na.rm = TRUE)) %>%
  arrange(mean_launch_speed)


batted_balls %>%
  mutate(vertical_launch_velocity = launch_speed * sin(launch_angle*(pi/180))) %>%
  mutate(horizontal_launch_velocity = launch_speed * cos(launch_angle*(pi/180)))


batted_balls %>%
  mutate(launch_speed_categorical = case_when(
    (launch_speed > 100) ~ "Very Fast",
    (launch_speed > 80) ~ "Fast",
    (launch_speed > 65) ~ "Meh",
    (launch_speed > 40) ~ "Kinda Slow",
    (is.na(launch_speed)) ~ NA,
    TRUE ~ "Was it even moving?"
  ))


batted_balls %>%
  left_join(park_dimensions, by = c("park" = "park"))


