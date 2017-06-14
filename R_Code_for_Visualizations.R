
library(plotly)
library(ggplot2)
library(ggrepel)
food <- read.csv("salads.csv",stringsAsFactors = F,header=T)

head(food)

plotTheme <- function(base_size = 12) {
  theme(
    text = element_text( color = "black"),
    plot.title = element_text(size = 10,colour = "black",hjust=0.5),
    plot.subtitle = element_text(face="italic"),
    plot.caption = element_text(hjust=0),
    axis.ticks = element_blank(),
    panel.background = element_blank(),
    panel.grid.major = element_line("grey80", size = 0.1),
    panel.grid.minor = element_blank(),
    strip.background = element_rect(fill = "grey80", color = "white"),
    strip.text = element_text(size=12),
    axis.title = element_text(size=8),
    axis.text = element_text(size=8),
    axis.title.x = element_text(hjust=1),
    axis.title.y = element_text(hjust=1),
    plot.background = element_blank(),
    legend.background = element_blank(),
    legend.title = element_text(colour = "black", face = "bold"),
    legend.text = element_text(colour = "black", face = "bold"))
}

names(food) <- c("Restaurant", "Item", "Calories", "Total_Fat", "Sodium", "Fiber", "Sugars", "Protein")
y <- list(
  title = "Total Fat",
  titlefont = 'Georgia'
)
x <- list(
  title = "",
  titlefont = 'Georgia'
)

plot_ly(food, x = ~Calories, y = ~Total_Fat, color = ~Restaurant, text = ~paste("Item ",Item),type="scatter",mode="markers", size=~Sodium) %>%
  layout(title="Calories, Total Fat and Sodium for each food-item (size represents Sodium) ", xaxis=x, yaxis=y) 

plot_ly(food, x = ~Calories, y = ~Total_Fat, color = ~Restaurant, text = ~paste("Item ",Item),type="scatter",mode="markers", size=~Sugars) %>%
  layout(title="Calories, Total Fat and Sugar for each food-item (size represents Sugar) ", xaxis=x, yaxis=y)

plot_ly(food, x = ~Item, y = ~Total_Fat, color = ~Restaurant, text = ~paste("Item ",Item),type="bar",orientation="v", mode="markers") %>%
  layout(title="Total Fat for each item ", xaxis=x, yaxis=y)

plot_ly(ggplot2:: diamonds, y = ~Protein, color=~Fiber,type="box") %>%
  layout(title="Proteins, Dietary Fibre,Carbs and Total Fat (Size represents Total Fat) ")

#########################################################################################################
###ggplot code

myplot = ggplot(food, aes(x=food$Calories, y=food$Total_Fat)) + geom_point(aes(size=food$Sodium,color=food$Restaurant))

myplot + theme(panel.background = element_rect(fill = 'white', color = 'black'))
