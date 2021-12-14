cat('\014')
rm (list = ls())

source(file = "interpolate.R")
vnames = read.table (file = "MPT-electrical.txt", sep = "\t", encoding = "UTF-8")

V1 = read.table (file = "MPT-electrical.txt", sep = "\t", encoding = "UTF-8", skip = 2)
V1.names = c("L.p.","Temperatura", "Temperatura bezwzględna", "Temp odw.", "Współczynnik Seebecka", "Współczynnik Seebecka (ERR)", "Rezystywność", "Rezystywność (ERR)", "Przewodnictwo właściwe Swl", "Przewodnictwo właściwe Swl (ERR)", "log(Swl)", "Temp próbki L (dt=0)", "Temp próbki H (dt=0)", "Temp próbki L (dt=X)", "Temp próbki H (dt=X)", "dT", "Seeb avg(U) (dt=0)", "Seeb avg(U) (dt=0) (ERR)", "Seeb avg(U) (dt=X)", "Seeb avg(U) (dt=X) (ERR)", "Swl avg(U)", "Swl avg(U) (ERR)", "Swl avg(I)", "Swl avg(I) (ERR)", "PowF", "Lambda", "ZT")
V1.idNames=c("LP"  ,"temperature", "temperatureABS"         , "tempInv"  , "seebeck"              , "seebeckERR"                 , "resistivity" , "resistivityERR"    , "swl"                       , "sweERR"                          , "log_swl" , "tempLdt0"            , "tempHdt0"            , "tempLdtX"            , "tempHdtX"            , "dT", "SeebAvgUdt0"       , "SeebAvgUdt0ERR"          , "SeebAvgUdtX"       , "SeebAvgUdtXERR"          , "swlAVGU"   , "swlAvgUERR"      , "swlAvgI"   , "swlAvgIERR"      , "PowF", "Lambda", "ZT")
V2 = read.table (file = "MPT-lambda_table.txt", sep = "\t", encoding = "UTF-8",header = T)

names(V1) = V1.idNames
lineared = V1
splined = V1

#reinseting Lambda column
lineared$Lambda = interpolate(x_in = V2$Temperature, y_in = V2$Lambda, x_out = V1$temperature, method = "linear")
splined$Lambda = interpolate(x_in = V2$Temperature, y_in = V2$Lambda, x_out = V1$temperature, method = "spline")

#recalculating ZT parameter
splined$ZT  = (splined$seebeck/10e6)^2*splined$swl/splined$Lambda*splined$temperatureABS
lineared$ZT = (lineared$seebeck/10e6)^2*lineared$swl/lineared$Lambda*lineared$temperatureABS