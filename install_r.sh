#!/bin/bash

# helper functions
function echo_headline(){ echo -e "\033[1;36m$1\033[0m"; }



# start
echo_headline start

sudo apt install software-properties-common
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -s -c)/"
gpg --keyserver pgpkeys.mit.edu --recv-key 51716619E084DAB9
gpg -a --export 51716619E084DAB9 | sudo apt-key add -


# updating
echo_headline update/upgrade

sudo apt-get update
sudo apt-get -y upgrade



# base r installation with dependencies for XML, xml2, RCurl, ... etc
echo_headline R base / R dev / R dependencies

sudo apt-get install -y r-base
sudo apt-get install -y r-base-dev
sudo apt-get install -y pandoc
sudo apt-get install -y libssl-dev
sudo apt-get install -y libxml2-dev
sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev

sudo apt-get -y install --no-install-recommends qpdf gfortran

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

Rscript -e 'install.packages("evaluate",       repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("formatR",        repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("highr",          repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("markdown",       repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("yaml",           repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("htmltools",      repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("caTools",      repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("knitr",      repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("rmarkdown",      repos="https://cloud.r-project.org/")'
Rscript -e 'install.packages("rdrop2",      repos="https://cloud.r-project.org/")'



