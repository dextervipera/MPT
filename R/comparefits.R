#data plotting function
#input (RAW, [[fits]])

out.start = 0
out.end = 320
mlt = 100
resultdiff = list()
resultdiff[[1]] = splined$Lambda - lineared$Lambda
resultdiff[[2]] = splined$Lambda - constant$Lambda
resultdiff[[3]] = constant$Lambda - lineared$Lambda
y.range = max(resultdiff[[1]])- min(resultdiff[[1]])
y.gnd = min (resultdiff[[1]])

#Plot-01 basic chart showing the difference between splined and liearly interpolated data
png(filename = "plot/G01-RelativeErr[Sp-Ln]-comp.png")
plot (x = splined$temperature, y = resultdiff[[1]]/splined$Lambda*mlt, type = 'p', 
      xlim = c(out.start-1, out.end+1), ylim = c(-2,2),
      ylab = "Sp-Ln - relative err [%]", xlab = "Independent variable",
      lwd = 2, col = "red", cex = 2)
points(x = V1$temperature, y = rep(x = (y.gnd-10*y.range)*mlt, length = 21), pch = 3, col = "blue", lwd = 2, cex = 2)
points(x = V2$Temperature, y = rep(x = (y.gnd-12*y.range)*mlt, length = 6), pch = 4, col ="green", lwd = 2, cex=2)
grid()
legend(0,2,legend=c("Difference", "V1.x", "V2.x"),
       col=c("red","red", "blue"), pch=c(1,3,4), cex=1)
dev.off()
#Plot 02
png(filename = "plot/G01-RelativeErr[Sp-Co]-comp.png")
plot (x = splined$temperature, y = resultdiff[[2]]/splined$Lambda*mlt, type = 'p', 
      xlim = c(out.start-1, out.end+1), ylim = c(-2,2),
      ylab = "Sp-Co - relative err [%]", xlab = "Independent variable",
      lwd = 2, col = "red", cex = 2)
points(x = V1$temperature, y = rep(x = (y.gnd-10*y.range)*mlt, length = 21), pch = 3, col = "blue", lwd = 2, cex = 2)
points(x = V2$Temperature, y = rep(x = (y.gnd-12*y.range)*mlt, length = 6), pch = 4, col ="green", lwd = 2, cex=2)
grid()
legend(0,2,legend=c("Difference", "V1.x", "V2.x"),
       col=c("red","red", "blue"), pch=c(1,3,4), cex=1)
dev.off()
#Plot 03
png(filename = "plot/G01-RelativeErr[Co-Ln]-comp.png")
plot (x = splined$temperature, y = resultdiff[[3]]/splined$Lambda*mlt, type = 'p', 
      xlim = c(out.start-1, out.end+1), ylim = c(-2,2),
      ylab = "Co-Ln - relative err [%]", xlab = "Independent variable",
      lwd = 2, col = "red", cex = 2)
points(x = V1$temperature, y = rep(x = (y.gnd-10*y.range)*mlt, length = 21), pch = 3, col = "blue", lwd = 2, cex = 2)
points(x = V2$Temperature, y = rep(x = (y.gnd-12*y.range)*mlt, length = 6), pch = 4, col ="green", lwd = 2, cex=2)
grid()
legend(0,2,legend=c("Difference", "V1.x", "V2.x"),
       col=c("red","red", "blue"), pch=c(1,3,4), cex=1)
dev.off()


#Plot chart showing the materials parameters
source(file = "plotlib.R")
parameterplot(x = lineared$temperature, y = lineared$seebeck,
              xlab = "Temperature [°C]", ylab = "Seebeck [µV/K]", 
              filename = "results/P01-USeeb-T.png")
parameterplot(x = lineared$temperature, y = lineared$swl,
              xlab = "Temperature [°C]", ylab = "Conductivity [S/m]", 
              filename = "results/P02-SWL-T.png")
parameterplot(x = lineared$temperature, y = lineared$Lambda, divide = "no",
              xlab = "Temperature [°C]", ylab = "Heat cond [W/mK]", 
              filename = "results/P03-Lambda-T.png")
parameterplot(x = lineared$temperature, y = lineared$ZT,
              xlab = "Temperature [°C]", ylab = "ZT [-]", 
              filename = "results/P03-ZT-T.png")
