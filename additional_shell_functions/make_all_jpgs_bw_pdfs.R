#!/usr/bin/Rscript
library(stringr)
files <- list.files(pattern=".jpg$")
filesout <- str_replace(files, ".jpg$", "_bw.pdf")
cat(length(files), ": ")
for ( i in seq_along(files) ) {
	cat(" ", i)
	command  <- "convert -density 300x300 -quality 2 -compress jpeg -colorspace Gray -colors 64"
	command  <- paste0(command, " '", files[i], "' '", filesout[i], "' ")
	system(command)
}
	cat("\n")
	system(paste("pdfunite", paste(filesout, collapse=" "), "alle_zusammen.pdf"))


