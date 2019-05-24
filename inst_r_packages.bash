# script for ubuntu (18.04.xx)

# helper functions
function echo_headline(){ echo -e "\033[1;36m$1\033[0m"; }



# start
echo_headline start

# updating
echo_headline update/upgrade

sudo apt-get update
sudo apt-get -y upgrade


sudo mkdir /usr/local/lib/R/site-library || true
sudo chmod o+w /usr/local/lib/R/site-library


# R package installation
# do the first by hand to make sure user library is create 
echo_headline R packages


Rscript -e 'install.packages("devtools",       repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("roxygen2",       repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("stringr",        repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("httr",           repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("rvest",          repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("dplyr",          repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("lubridate",      repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("magrittr",       repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("jsonlite",       repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("devtools",       repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("RSelenium",      repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("sp",             repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("httpuv",         repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("RCurl",          repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("d3Network",      repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("ggplot2",        repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("hellno",         repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("wikipediatrend", repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("robotstxt",      repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("cranlogs",       repos="https://cloud.r-project.org/")'

Rscript -e 'install.packages("evaluate",     repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("formatR",      repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("highr",        repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("markdown",     repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("yaml",         repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("htmltools",    repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("caTools",      repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("knitr",        repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("rmarkdown",    repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("rdrop2",       repos="https://cloud.r-project.org/")'

Rscript -e 'install.packages("hms",          repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("data.table",   repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("DBI",          repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("dbplyr",       repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("digest",       repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("fs",           repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("future",       repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("future.apply", repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("glue",         repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("httr",         repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("jsonlite",     repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("knitr",        repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("prettyunits",  repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("R6",           repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("RPostgreSQL",  repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("RSQLite",      repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("rvest",        repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("urltools",     repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("utf8",         repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("V8",           repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("xml2",         repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("usethis",         repos="https://cloud.r-project.org/")'

