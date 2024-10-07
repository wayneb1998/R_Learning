library(tidyverse)
View(Diamonds)
View(diamonds)

# -- Subset by Rows with Filter() -- #
diamonds_sm <- filter(diamonds, cut == "Ideal")
View(diamonds_sm)

diamonds_sm <- filter(diamonds, price > 10000)
View(diamonds_sm)

diamonds_sm <- filter(diamonds, price > 10000, cut == "Ideal")
View(diamonds_sm)

#Note: Do not have to type view() each time once the variable is already updated
diamonds_sm <- filter(diamonds, price > 10000 | cut == "Ideal")
View(diamonds_sm)

#Filter for missing values use is.na (is missing) or !is.na (is not missing)

# -- Subset by column with select() -- #
diamonds_sm <- select(diamonds, cut, color)
View(diamonds_sm)

diamonds_sm <- select(diamonds, 1:4)
view(diamonds_sm)

diamonds_sm <- select(diamonds, starts_with("C"))
View(diamonds_sm)

diamonds_sm <- select(diamonds, ends_with("E"))
View(diamonds_sm)

diamonds_sm <- select(diamonds, price, everything())
View(diamonds_sm)

diamonds_sm <- select(diamonds, -price)
view(diamonds_sm)

# using the pipe #
diamonds_sm <- diamonds %>%
  select(-price)
view(diamonds_sm)


# -- re-order columns with arrange -- #

diamonds_arr <- diamonds %>%
  arrange(color)
view(diamonds_arr)

diamonds_arr <- diamonds %>%
  arrange(color, carat)

diamonds_arr <- diamonds %>%
  arrange(carat, color)

# -- modify and add columns with mutate -- #

diamonds_new <- diamonds %>%
  mutate(mass_g = .20 * carat)
glimpse(diamonds_new)
view(diamonds_new)

diamonds_new <- diamonds %>%
  mutate(mass_g = .20 * carat, price_per_carat = price / carat)
glimpse(diamonds_new)

diamonds_new <- diamonds %>%
  mutate(mass_g = .20 * carat, price_per_carat = price / carat, cut =tolower(cut))
glimpse(diamonds_new)
view(diamonds_new)

diamonds_new <- diamonds %>%
  mutate(mass_g = .20 * carat, price_per_carat = price / carat, cut =tolower(cut), expensive_TF = price > 10000)
glimpse(diamonds_new)
view(diamonds_new)


# Group Bys ---------------------------------------------------------------

diamonds %>%
  group_by(cut) %>%
  summarise(mean(price))

diamonds %>%
  group_by(expensive = price > 10000) %>%
  summarise(mean(price))

diamonds %>%
  group_by(expensive = price > 10000) %>%
  summarise(avg_price =  mean(price), 
  sd_price = sd(price),
  count = n())

