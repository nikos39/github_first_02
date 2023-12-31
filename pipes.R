# 11 Using Pipes

# 11.1

# Performing an operation using a series of steps.
my_numbers <- seq(from = 2, to = 100, by = 2)
my_numbers_logged <- log(my_numbers)
mean_my_numbers_logged <- mean(my_numbers_logged)
mean_my_numbers_logged

# Performing an operation using nested functions.
mean_my_numbers_logged <- mean(log(seq(from = 2, to = 100, by = 2)))
mean_my_numbers_logged

# Performing an operation using pipes.
mean_my_numbers_logged <- seq(from = 2, to = 100, by = 2) |>
  log() |>
  mean()
mean_my_numbers_logged

# 11.2

mean(c(2, 4, 6, 8))
c(2, 4, 6, 8) |> mean()

# Simulate some data
# Load package
library(dplyr)

height_and_weight <- tibble(
  id = c("001", "002", "003", "004", "005"),
  sex = c("Male", "Male", "Female", "Female", "Male"),
  ht_in = c(71, 69, 64, 65, 73),
  wt_lbs = c(190, 176, 130, 154, 173)
)

height_and_weight

# Filter is a nice command!
filter(height_and_weight, sex == "Female")

# Remember that pipes pass to the first argument
height_and_weight |> filter(sex == "Female")

# Good code practise examples
female_height_and_weight <- height_and_weight %>% 
  filter(sex == "Female") %>% 
  summarise(
    mean_ht = mean(ht_in),
    sd_ht = sd(ht_in)
  ) %>% 
  print()

# and please avoid <- 
female_height_and_weight <- height_and_weight |> filter(sex == "Female") |> 
  summarise(mean_ht = mean(ht_in), sd_ht = sd(ht_in)) |> print()  