# R-Programming Assignment#1

pollutantmean = function(directory, pollutant, id = 1:332){
  lst = list()
  for (i in id) {
    dir = paste(formatC(i, width = 3, flag = "0"),".csv", sep ="")
    lst[[i]] = read.csv(dir, stringsAsFactors = FALSE)
  }
  data = do.call(rbind, lst)
  mean(data[,pollutant], na.rm = TRUE)
  
}

# complete = function(directory, id = 1:332){
#   setwd(directory)
#   lst = list()
#   for (i in id){
#     file = paste(formatC(i, width = 3, flag = "0"),".csv", sep = "")
#     temp_dat =  read.csv(dir, stringsAsFactors = FALSE)
#     v = c(i, nrow(temp_dat[complete.cases(temp_dat),]))
#     names(v) = c("id", "nobs")
#     lst[[i]] = v
#     }
#   data.frame(do.call(rbind, lst))
# }