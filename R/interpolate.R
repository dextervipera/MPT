interpolate <- function(x_in, y_in, x_out, method = "default")
{
  #https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/approxfun
  if (method == "default")
  {
    interpolate = approx(x=x_in ,y=y_in ,xout = x_out, rule = 2)
  }
}
