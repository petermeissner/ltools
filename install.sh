# helper functions
function echo_headline(){ echo -e "\033[1;36m$1\033[0m"; }



# start
echo_headline start

sudo apt-get install -y apt-transport-https
sudo apt-get install -y software-properties-common

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

# Rstudio installation
echo_headline Rstudio download and installation

wget -O ~/rstudio.deb "http://www.rstudio.org/download/latest/stable/server/ubuntu64/rstudio-server-latest-amd64.deb"
sudo apt-get install -y gdebi 
sudo gdebi rstudio.deb -n
rm rstudio.deb


# else
sudo apt-get update
sudo aptitude install -y libreadline-dev


# basic calculator / doing some math in commandline
sudo apt-get install bc


# Latex
echo_headline LaTex

sudo apt-get install texlive -y
sudo apt-get install texlive-latex-extra -y
sudo apt-get install texlive-lang-german -y
sudo apt-get install texlive-lang-english -y

# Latex / R
sudo apt-get install texinfo -y
sudo apt-get install texlive-fonts-extra -y


# image processing
sudo apt-get install imagemagick -y


# Utilities
sudo apt-get install nano -y
sudo apt-get install htop -y





#### font ######################################################################

sudo apt-get install fonts-hack-otf -y
sudo apt-get install fonts-hack-ttf -y
sudo apt-get install fonts-hack-web -y




#### git #######################################################################

# autocompletion 

wget -O ~/.git-completion.bash "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash"


# prompt 

wget -O ~/.git-prompt.bash "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh"


# colors

cp ~/ltools/.gitconfig ~/


# configs 

git config --global push.default matching





#### mint ######################################################################

#sudo apt-get install dconf-editor -y

#gsettings set org.cinnamon.desktop.keybindings.wm toggle-recording ['']
#gsettings set org.cinnamon.desktop.keybindings.wm switch-to-workspace-down ['']
#gsettings set org.cinnamon.desktop.keybindings.wm switch-to-workspace-up ['']




#### python stuff ##############################################################

sudo apt-get install python-pip
sudo -H pip install --upgrade pip
sudo -H pip install pg_activity





















