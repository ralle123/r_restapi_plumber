library(jsonlite)
mod <- readRDS('model.RDS')
#data <- readRDS("testx.RDS")

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
mod <- readRDS("model.RDS")
# dat <- readRDS("testx.RDS")

#* predict diamond price
#*
#* @param new_data new data
#* @get /predict_price
function(data) {
  one_row <- as.data.frame(jsonlite::fromJSON(data))
  print(one_row)
  return(
    list(
      price = predict.lm(mod, newdata = one_row)
    )
  )
}

#* Predict a diamond price given separate values
#* @param carat
#* @param cut
#* @param color
#* @param clarity
#* @param depth
#* @param table
#* @param x
#* @param y
#* @param z
#* @get /predict2
function(carat, cut, color, clarity, depth, table, x, y, z) {
  dat <- data.frame(
    carat = as.numeric(carat),
    cut = as.character(cut),
    color = as.character(color),
    clarity = as.character(clarity),
    depth = as.numeric(depth),
    table = as.numeric(table),
    x = as.numeric(x),
    y = as.numeric(y),
    z = as.numeric(z)
  )
  return(
    list(
      price = predict.lm(mod, dat)
    )
  )
}

