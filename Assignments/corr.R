# R-Programming Assignment#1

# pollutantmean = function(directory, pollutant, id = 1:332){
#   lst = list()
#   for (i in id) {
#     dir = paste(formatC(i, width = 3, flag = "0"),".csv", sep ="")
#     lst[[i]] = read.csv(dir, stringsAsFactors = FALSE)
#   }
#   data = do.call(rbind, lst)
#   mean(data[,pollutant], na.rm = TRUE)
#   
# }

# complete = function(directory, id = 1:332){
#   lst = list()
#   for (i in seq_along(id)){
#     file = paste(formatC(id[i], width = 3, flag = "0"),".csv", sep = "")
#     temp_dat =  read.csv(file, stringsAsFactors = FALSE)
#     v = c(id[i], nrow(temp_dat[complete.cases(temp_dat),]))
#     names(v) = c("id", "nobs")
#     lst[[i]] = v
#     }
#   data.frame(do.call(rbind, lst))
# }

corr = function(directory, threshold = 0){
  file_lst = list.files(directory)
  v = numeric(0)
  i = 1
  for (file in file_lst){
    temp_dat =  read.csv(paste(dir,"\\",file,sep=""), stringsAsFactors = FALSE)
    temp_dat = temp_dat[complete.cases(temp_dat),]
    nr = nrow(temp_dat)
    if (nr > threshold){
      correlation = cor(temp_dat[,"nitrate"], temp_dat[,"sulfate"])
      v[i] = correlation
      i = i + 1
      }
    }
  return(v)
}

