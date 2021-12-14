cat('\014')
rm(list = ls())
source(file = "interpolate.R")

xT = 1:10
yT = (1:10)^2/10
out.start = -1;
out.end = 12;
out.by = 0.1;

out = interpolate(x_in = xT, y_in = yT, x_out = seq(from = out.start, to = out.end, by = out.by))

plot (x = xT, y = yT, type = 'p', xlim = c(out.start, out.end))
lines(x = out$x, y=out$y, col = "blue", lwd = 2)