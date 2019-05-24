# script for ubuntu (18.04.xx)

# helper functions
function echo_headline(){ echo -e "\033[1;36m$1\033[0m"; }



# start
echo_headline start

# updating
echo_headline update/upgrade

sudo apt update
sudo apt -y upgrade



# base r installation with dependencies for XML, xml2, RCurl, ... etc
echo_headline R base / R dev / R dependencies

sudo apt install -y r-base
sudo apt install -y r-base-dev
sudo apt install -y pandoc
sudo apt install -y libssl-dev
sudo apt install -y libxml2-dev
sudo apt install -y libssl-dev
sudo apt install -y libv8-dev
sudo apt install -y libcurl4-openssl-dev
sudo apt install -y libpq-dev

sudo apt -y install --no-install-recommends qpdf gfortran
