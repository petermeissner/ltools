# start 
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -s -c)/"
gpg --keyserver pgpkeys.mit.edu --recv-key 51716619E084DAB9  
gpg -a --export 51716619E084DAB9 | sudo apt-key add -

 
# updating
sudo apt-get update
sudo apt-get -y upgrade


# git 
sudo apt-get install -y git
git clone "https://github.com/petermeissner/ltools.git"


# base r installation with dependencies for XML, xml2, RCurl, ... etc
sudo apt-get install -y r-base
sudo apt-get install -y r-base-dev
sudo apt-get install -y pandoc
sudo apt-get install -y libssl-dev
sudo apt-get install -y libxml2-dev 
sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev

sudo apt-get -y install --no-install-recommends qpdf gfortran


# R package installation
# do the first by hand to make sure user library is created 

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



# Rstudio installation
Rscript -e 'library(rvest);html  <- read_html("https://www.rstudio.com/products/rstudio/download/");links <- html_nodes(html, "a") %>% html_attr("href");link  <- grep("amd64.*deb$", links, value=TRUE);download.file(link, "rstudio.deb")'

sudo apt-get install -y gdebi 
sudo gdebi rstudio.deb -n
rm rstudio.deb


# else
sudo apt-get update
sudo aptitude install -y libreadline-dev


# basic calculator / doing some math in commandline
sudo apt-get install bc


# Latex
sudo apt-get install texlive -y
sudo apt-get install texlive-latex-extra -y
sudo apt-get install texlive-lang-german -y
sudo apt-get install texlive-lang-english -y

# Latex / R
sudo apt-get install texinfo
sudo apt-get install texlive-fonts-extra


# image processing
sudo apt-get install imagemagick


# pgadmin
# https://wiki.postgresql.org/wiki/Apt
# http://stackoverflow.com/a/226724/1144966
while true; do
    read -p "Do you wish to install postgresql database?" yn
    case $yn in
        [Yy]* ) 
					sudo apt-get install postgresql; break;		
				;;
        [Nn]* ) 
					echo "ok, no install ..."; break;
				;;
        * ) echo "Please answer yes or no.";;
    esac
done

while true; do
    read -p "Do you wish to install pgadmin for postgresql database administration?" yn
    case $yn in
        [Yy]* ) 
					sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
					sudo apt-get install wget ca-certificates
					wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
					sudo apt-get update
					sudo apt-get upgrade
					sudo apt-get install pgadmin3					
					break;		
				;;
        [Nn]* ) 
					echo "ok, no install ..."; break;
				;;
        * ) echo "Please answer yes or no.";;
    esac
done


# font
# wget https://github.com/chrissimpkins/Hack/releases/download/v2.019/Hack-v2_019-ttf.zip


# nautilus right click open in terminal
while true; do
    read -p "Do you wish to install pgadmin for postgresql database administration?" yn
    case $yn in
        [Yy]* ) 
					sudo apt-get install nautilus-open-terminal;
					break;		
				;;
        [Nn]* ) 
					echo "ok, no install ..."; break;
				;;
        * ) echo "Please answer yes or no.";;
    esac
done

















