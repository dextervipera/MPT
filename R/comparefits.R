#data plotting function
#input (RAW, [[fits]])

out.start = 0
out.end = 320
mlt = 100

resultdiff = splined$Lambda - lineared$Lambda
y.range = max(resultdiff)- min(resultdiff)
y.gnd = min (resultdiff)

png(filename = "G01-RelativeErr-comp.png")
plot (x = splined$temperature, y = resultdiff/splined$Lambda*mlt, type = 'p', 
      xlim = c(out.start-1, out.end+1), ylim = c(-2,2),
      ylab = "relative err [%]", xlab = "Independent variable",
      lwd = 2, col = "red", cex = 2)
points(x = V1$temperature, y = rep(x = (y.gnd-10*y.range)*mlt, length = 21), pch = 3, col = "blue", lwd = 2, cex = 2)
points(x = V2$Temperature, y = rep(x = (y.gnd-12*y.range)*mlt, length = 6), pch = 4, lwd = 2, cex=2)
grid()
legend(0,2,legend=c("Difference", "V1.x", "V2.x"),
       col=c("red","red", "blue"), pch=c(1,3,4), cex=1)
dev.off()
