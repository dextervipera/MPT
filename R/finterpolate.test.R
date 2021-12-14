cat('\014')
rm(list = ls())
source(file = "interpolate.R")

xT = 1:10
yT = (1:10)^2/10
out.start = -1;
out.end = 12;
out.by = 0.5;

x_vec = seq(from = out.start, to = out.end, by = out.by)
y_lin = interpolate(x_in = xT, y_in = yT, x_out = x_vec, method = "linear")
y_spl = interpolate(x_in = xT, y_in = yT, x_out = x_vec, method = "spline")

plot (x = xT, y = yT, type = 'p', 
      xlim = c(out.start-1, out.end+1), ylim = c(0,15),
      ylab = "linear",
      lwd = 2)
lines(x = x_vec, y=y_lin, col = "blue", lwd = 2)
lines(x = x_vec, y=y_spl, col = "red", lwd = 2)
