
library(ggplot2)
#* Echo my name
#*
#* @get /whoami
function(){
  return(
    list(name="raul")
  )
}
#* Echo my name
#*
#* @param msg the message to echo
#* @get /echo
function(msg=""){
  return(
    list(msg = paste0("Message:'",msg,"'"))
  )
}

#* take the average between 2 numbers
#* @param x the first number
#* @param y the second number
#* @get /avg2
function(x,y){
  x <- as.numeric(x)
  y <- as.numeric(y)
  return(
    list(result = (x + y) / 2)
  )
}

#* plots cars dataset
#*
#* @get /carplot
#* @png
function() {
  print(
    ggplot(cars, aes(x = speed, y = dist)) + geom_point()
  )
}

#* generate an error
#*
#* @get /err
function(res) {
  msg <- 'Hi! you did something wrong :)'
  res$status <- 400 #bad request
  return(
    list(error = jsonlite::unbox(msg))
  )
}
