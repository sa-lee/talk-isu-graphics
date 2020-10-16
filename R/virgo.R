library(dplyr)
library(palmerpenguins)

p <- penguins %>%
  vega() %>%
  mark_point(enc(x = bill_length_mm, y = flipper_length_mm))

p2 <- penguins %>% 
  vega() %>% 
  mark_point(enc(x = bill_depth_mm, y = bill_length_mm))


hconcat(p, p2)

selection <- select_interval()

p <- penguins %>%
  vega() %>%
  mark_point(enc(x = bill_length_mm, y = flipper_length_mm),
             selection = c(
               color_if(selection, species, "grey"),
               opacity_if(selection, 1, 0.5)
             ))


p2 <- penguins %>% 
  vega() %>% 
  mark_point(enc(x = bill_depth_mm, y = bill_length_mm),
             selection = color_if(selection, species, "grey"))


hconcat(p, p2)