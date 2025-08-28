# load -----
library(tidyverse)
library(edfinr)

or_sy22 <- get_finance_data(yr = "2022", geo = "OR")

# plot local rev pp vs total rev pp ----
ggplot(or_sy22) +
  geom_point(aes(
    x = rev_local_pp, 
    y = rev_total_pp,
    color = urbanicity,
    size = enroll),
    alpha = .6) +
  scale_size_area(
    max_size = 10,
    labels = scales::label_comma()
    ) +    
  scale_x_continuous(labels = scales::label_dollar()) +
  scale_y_continuous(labels = scales::label_dollar()) +
  labs(
    title = "Oregon Districts' Local vs. Total Revenue Per-Pupil, SY2021-22",
    x = "Local Revenue Per-Pupil", 
    y = "Total Revenue Per-Pupil", 
    size = "Enrollment", 
    color = "Urbanicity") +
  theme_bw()

ggsave("figures/or_local_vs_total.png", units = "in", height = 5, width = 7)

#  plot pov rate vs total rev pp -------
ggplot(or_sy22) +
  geom_point(aes(
    x = stpov_pct, 
    y = rev_total_pp,
    color = urbanicity,
    size = enroll),
    alpha = .6) +
  scale_size_area(
    max_size = 10,
    labels = scales::label_comma()
    ) +    
  scale_x_continuous(labels = scales::label_percent()) +
  scale_y_continuous(labels = scales::label_dollar()) +
  labs(
    title = "Oregon District Poverty Rates vs. Total Revenue Per-Pupil, SY2021-22",
    x = "District SAIPE Poverty Rate", 
    y = "Total Revenue Per-Pupil", 
    size = "Enrollment", 
    color = "Urbanicity") +
  theme_bw()

ggsave("figures/or_stpov_vs_total.png", units = "in", height = 5, width = 7)
