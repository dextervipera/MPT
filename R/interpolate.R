interpolate <- function(x_in, y_in, x_out, method = "linear")
{
  #https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/approxfun
  if (method == "linear")
  {
    interpolate = approx(x=x_in ,y=y_in ,xout = x_out, rule = 2)$y
  } else
  if (method == "spline"){
    interpolate = splinefun(x =x_in, y = y_in)(x_out)
  } else
  {
    interpolate = ones(x_out)
  }
}


