map(m, proj = 'orth', orient = c(41,-74,0))
map.grid(m, col = 2, nx = 6, ny = 5, label = FALSE, lty = 2)
points(
  mapproject(
    list(y = 25, x = -74)
  ),
  col = 3,
  pch = "+",
  cex = 5
)# centre on NY