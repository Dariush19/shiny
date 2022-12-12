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
