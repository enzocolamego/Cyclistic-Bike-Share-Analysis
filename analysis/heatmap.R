library(tidyverse)
library(ggplot2)
library(dplyr)
library(lubridate)

copy_bike_data <- bike.data.clean %>%
  mutate(started_at = ymd_hms(started_at)) %>%
  mutate(round_time = round_date(started_at, unit = "1 hour"))

copy_bike_data <- copy_bike_data %>%
  mutate(
    day = as.Date(round_time),
    time = format(round_time, "%H:%M:%S")
  )

heatmap_data <- copy_bike_data %>%
  group_by(weekday, time, member_casual) %>%
  summarise(count = n()) %>%
  ungroup()

heatmap_data <- heatmap_data %>%
  complete(weekday = 1:7, time, member_casual, fill = list(count = 0))

heatmap_data$weekday <- factor(heatmap_data$weekday, levels = 1:7, labels = c("Sun","Mon","Tue","Wed","Thu","Fri","Sat"))

ggplot(heatmap_data, aes(x=weekday, y=time, fill = count)) +
  geom_tile() +
  scale_fill_gradient2(low = "lightsteelblue", midpoint = -150, high = "darkblue") +
  labs(title = "Heatmap", x = "Day of week", y = "Time") +
  facet_wrap(~ member_casual) +
  theme(plot.title = element_text(hjust = 0.5))
