setwd("~/Dropbox/CircleLab/WHALE/DepThreat")
data<-read.csv("adversity.csv")

library(ggplot2)
library(tidyr)
data$Threat<-data$THREAT_sum
data$Deprivation<-data$DEP_sum
df <- data %>%
  pivot_longer(cols = c(Threat, Deprivation), 
               names_to = "source", 
               values_to = "value")
p<-ggplot(df, aes(x=value))+
  geom_histogram(color="black", fill="gray", binwidth = 0.5)+
  facet_grid(source ~ .)+
  labs(x = "Number of different types of adversity exposures", y = "Number of children")+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_blank(),
        panel.border = element_blank())
p
