#!/usr/bin/Rscript
library(stringr)
files <- list.files(pattern=".jpg$")
for ( i in seq_along(files) ) {
	filesout <- str_replace(files[i], ".jpg$", "_x1024.jpg")
	command  <- "convert -resize 1024x1024 -strip -interlace Plane -gaussian-blur 0.05 -quality 85% "
	command  <- paste0(command, " '", files[i], "' '", filesout, "' ")
	system(command)
}


