#!/usr/bin/Rscript
args = commandArgs(trailingOnly=TRUE)
n=12

special  = "-_.:#'+*~<>| "

universe <- 
  unlist(
    c(
      letters,
      LETTERS,
      0:9,
      strsplit(special,"")
    )
  )

pw<-""

anygrepl <- function(pattern, x){
  apply(as.data.frame(lapply(pattern, grepl, x)), 1, any)
}
while( !any(anygrepl(letters, pw)) | !any(anygrepl(LETTERS,pw)) ){
  pw  <- sample(universe, n, replace=TRUE)
}
cat(paste(pw, collapse=""),"\n")

