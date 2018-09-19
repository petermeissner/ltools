# Install Script for Postgres-10
# 
# source: https://websiteforstudents.com/installing-postgresql-10-on-ubuntu-16-04-17-10-18-04/


# Keys and Repos
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
# sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" > /etc/apt/sources.list.d/pgdg_bionic.list'
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main" > /etc/apt/sources.list.d/pgdg_xenial.list'


sudo apt update
sudo apt-get install postgresql-10 -y

# sudo systemctl stop postgresql.service
# sudo systemctl start postgresql.service
# sudo systemctl enable postgresql.service
# sudo systemctl status postgresql.service
