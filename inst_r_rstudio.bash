# script for ubuntu (18.04.xx)

# helper functions
function echo_headline(){ echo -e "\033[1;36m$1\033[0m"; }

# start
echo_headline start

# updating
echo_headline update/upgrade

sudo apt-get update
sudo apt-get -y upgrade


# Rstudio installation
echo_headline Rstudio download and installation

echo_headline download
wget -O ~/rstudio.deb "http://www.rstudio.org/download/latest/stable/server/ubuntu64/rstudio-server-latest-amd64.deb"

echo_headline install dependencies
sudo apt-get install -y gdebi 

echo_headline install rstudio
sudo gdebi ~/rstudio.deb -n

echo_headline remove downloaded file
rm ~/rstudio.deb
