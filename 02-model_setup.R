#this script represents the data and a ml pipeline
library("dplyr")
data("diamonds",package = "ggplot2")

test_i <- sample(1:nrow(diamonds),size = round(.20 * nrow(diamonds)))

data_test_x <- diamonds %>% dplyr::slice(test_i) %>% select(-price)
data_test_y <- diamonds %>% dplyr::slice(test_i) %>% select(price)
data_train  <- diamonds[-test_i,]

names(data_train)

fit <- lm(price ~ .,data = data_train)
predict(fit,newdata = data_test_x[2,])
saveRDS(data_test_x,file = "testx.RDS")
saveRDS(data_test_y,file = "testy.RDS")
saveRDS(fit,file = "model.RDS")
