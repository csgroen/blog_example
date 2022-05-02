# Mon May  2 11:04:39 2022 ------------------------------
library(tidyverse)
library(ggbeeswarm)
library(ggrepel)

#-- Get data
data("msleep")
msleep2 <- msleep %>%
    select(name, vore, sleep_total) %>%
    filter(!is.na(vore))

#-- Get some annotation (sleepiest, least sleepy, some honorable mentions)
sleepiest <- top_n(msleep2, 5, sleep_total) %>% .[c(1,3,5),]
least_sleepy <- top_n(msleep2, -3, sleep_total)
middle <- msleep2 %>% filter(name %in% c("Dog", "Human", "Macaque"))

annots <- bind_rows(sleepiest, least_sleepy, middle)

#-- Plot
ggplot(msleep2, aes(vore, fill = vore, sleep_total)) +
    geom_violin(alpha = 0.5) +
    geom_quasirandom(size = 1) +
    geom_text_repel(aes(label = name), size = 3, data = annots, hjust = 0, vjust = 1) +
    stat_summary(fun = median, geom = "crossbar", width = 0.6, size = 0.2) +
    labs(x = "Feeding behavior (vore)", y = "Total sleep per night (hours)") +
    guides(fill = "none") +
    theme_light()

