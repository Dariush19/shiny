require(ggplot2)
library(ggplot2)
# help(mtcars)
str(mtcars) 
summary(mtcars) 
mpg
hp
myGraph <- ggplot(mtcars, aes(mpg, vs))
myGraph
myGraph + geom_point()
myGraph + geom_point(colour = "Blue") 
g1 <- myGraph + geom_point(colour = "Blue") 
g1

myGraph <- ggplot(data = mtcars, aes(x = mpg, y = hp))
hp

varx <- c(c('me', 10), c('you', 20))
varx
ggplot(data = varx, aes(x = mpg, y = hp))
print(mtcars)
typeof(mtcars)

x1  <- data.frame("Name" = c("John", "Dora", "Sara"), "Age"=c(20,30, 40), 
                  "State"=c("NSW", "Vic", "NSW"))
x2 <- data.frame("Name" = c("Jack", "Julie", "Sean"), "Age"=c(20,40, 50),
                 State=c("Vic", "TAS", "QLD"))
x <- rbind(x1,x2)
ggplot(data = x, aes(x = Name, y = Age)) + geom_point(aes(shape = Name, 
                                                          color="State"))

sample_data <- read.csv("e:/Personal_Files/Dariush/monash/visual/m2/act1/sample-data-for-r-plot.csv")
head(sample_data)
ggplot(sample_data, aes(Year, Number)) + geom_point() + 
  geom_point(aes(shape = Sex, color=State, size=Number))

ggplot(sample_data, aes(Year, Number)) + 
  geom_point(aes(color = State)) +
  facet_wrap(~Sex)

ggplot(sample_data, aes(Year, Number)) + 
  geom_point(aes(color = Sex)) +
  facet_wrap(~State, nrow=1)

ggplot(sample_data, aes(Year, Number)) + 
  geom_point(aes(color=Sex)) +
  facet_grid(Sex~State)

ggplot(sample_data, aes(Year, Number)) + 
  geom_bar(stat = "identity") +
  facet_grid(Sex~State)

eco_data <- read.csv("E:/Personal_Files/Dariush/monash/visual/m2/act1/EconomistData.csv.csv")
head(eco_data)

ggplot(eco_data, aes(x = CPI, y = HDI, color=Region)) + geom_point(shape=3)


labels <- c("Congo", "Sudan", "Afghanistan", "Greece", "China",
            "India", "Rwanda", "Spain", "France", 
            "United States", "Japan", "Norway", "Singapore")

plot1 <- ggplot(eco_data, aes(x = CPI, y = HDI, color = Region)) 
plot1 <- plot1 + geom_point(shape = 1)
plot1
plot2 <- plot1 +
  geom_text(aes(label = Country),
            color = "black", size = 5, hjust = 1.1,
            data = eco_data[eco_data$Country %in% labels, ])
plot2

plot3 <- plot2 +
  geom_smooth(aes(group = 1),
              method = "lm",
              color = "black",
              formula = y~ poly(x, 2),
              se = FALSE)
plot3

plot4 <- plot3 + theme_bw() +
  scale_x_continuous("Corruption Perceptions Index, 2011\n(10 = least corrupt)") +
  scale_y_continuous("Human Development Index, 2011\n(1 = best)") +
  theme(legend.position = "top", legend.direction = "horizontal")
plot4


library(ggvis)
p <- ggvis(mtcars, x = ~hp, y = ~mpg)
layer_points(p)

mtcars %>%
  ggvis(~wt, ~mpg,
        size := input_slider(10, 100),
        opacity := input_slider(0, 1)
  ) %>%
  layer_points()




install.packages("manipulate")
library(manipulate)
manipulate(plot(1:x), x = slider(1, 100))
manipulate(
  plot(
    cars, xlim = c(0, x.max),
    type = type, ann = label, col=col, pch=pch, cex=cex
  ),
  x.max = slider(10, 25, step=5, initial = 25),
  type = picker("Points" = "p", "Line" = "l", "Step" = "s"),
  label = checkbox(TRUE, "Draw Labels"),
  col=picker("red"="red", "green"="green", "yellow"="yellow"),
  pch = picker("1"=1,"2"=2,"3"=3, "4"=4, "5"=5, "6"=6,"7"=7,
               "8"=8, "9"=9, "10"=10,"11"=11, "12"=12,"13"=13, "14"=14,
               "15"=15, "16"=16, "17"=17, "18"=18,"19"=19,"20"=20,
               "21"=21,"22"=22, "23"=23,"24"=24
  ),
  cex=picker("1"=1,"2"=2,"3"=3, "4"=4,
             "5"=5,"6"=6,"7"=7,"8"=8, "9"=9, "10"=10
  )
)
# pch



