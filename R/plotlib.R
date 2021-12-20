parameterplot <- function(x,y,xlab = "ind. var.", ylab = "dep. var.", filename = ":prev",  divide="auto", lwd = 2, pch = 1, cex = 2)
{
x_div = length(x);
xmargin = 0.1
ymargin = 0.1
xrange = max(x)-min(x)
yrange = max(y)-min(y)
xlim = c(min(x)-xmargin*xrange,max(x)+xmargin*xrange)
ylim = c(min(y)-ymargin*yrange,max(y)+ymargin*yrange)

    if (divide == "auto") x_div = which.max(x)
  print(x_div)
  if (filename!=":prev") png(filename = filename)
  plot(x=x[1:x_div],y=y[1:x_div],
       xlab = xlab, ylab = ylab, lwd = lwd, pch = pch, cex = cex, col = "red",
       xlim = xlim, ylim = ylim)
  if (x_div < length(x))    points(x = x[x_div+1:length(x)], y = y[x_div+1:length(x)],
                                   lwd = lwd, pch = pch, cex = cex, col = "blue")
  grid()
  if (filename!=":prev") dev.off()
}

main <- function() {
  vecx = c(1:11,10:1)
  vecy = vecx^2+(1:length(vecx))
  parameterplot(x = vecx, y = vecy, divide = "auto", 
                xlab = "Temperature [°C]", ylab = "Seebeck coeff. [µV/K]", filename = ":prev")
  cat ('\014')
  cat ("Sourced executed")
}

if (!interactive()) {
  main()
}