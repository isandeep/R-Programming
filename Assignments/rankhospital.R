# Assignment 3: R- programming

# best = function(state, outcome){
#   file = read.csv("outcome-of-care-measures.csv", 
#                   colClasses = "character")
#   outcomes = c("heart attack", "heart failure", "pneumonia")
#   if(!(state %in% file$State)) stop("Invalid State")
#   if(!(outcome %in% outcomes)) stop("Invalid outcome")
#   names(file)[c(11,17,23)] = outcomes
#   file[,outcome] = as.numeric(file[,outcome])
#   sub_file = file[file$State == state,]
#   sub_file = sub_file[order(sub_file[,c(outcome,"Hospital.Name")]),]
#   return(sub_file[,2][1])  
#   
# }


rankhospital = function(state, outcome, num){
  file = read.csv("outcome-of-care-measures.csv", 
                  colClasses = "character")
  outcomes = c("heart attack", "heart failure", "pneumonia")
  if(!(state %in% file$State)) stop("Invalid State")
  if(!(outcome %in% outcomes)) stop("Invalid outcome")
  if(num == "best") num = 1
  names(file)[c(11,17,23)] = outcomes
  file[,outcome] = as.numeric(file[,outcome])
  sub_file = file[file$State == state,]
  sub_file = sub_file[order(sub_file[,c(outcome,"Hospital.Name")]),]
  if(num == "worst") {
    temp = sub_file[[outcome]]
    out = sub_file[!is.na(temp),2]  
    return(out[length(out)])
  }
  return(sub_file[,2][num])  
  
}