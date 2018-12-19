# dependencies

sudo apt-get install php5-gd -y
sudo apt-get install php5-ldap -y
sudo apt-get install php5-imap -y 
sudo php5enmod imap

sudo apache2ctl restart

# limesurvey 

wget https://www.limesurvey.org/de/stable-release?download=1691:limesurvey250plus-build160517zip
unzip stable-releas*
rm stable-releas*
sudo mv limesurvey /var/www/

sudo chown -R www-data.www-data /var/www/limesurvey/ 
sudo chmod 774 /var/www/limesurvey/
sudo chmod 776 /var/www/limesurvey/tmp/


# create database

sudo mysql -p
	# CREATE USER 'limesurvey'@'localhost' IDENTIFIED BY '>>PASSWORD<<';
	# CREATE DATABASE limesurvey;
	# GRANT ALL PRIVILEGES ON limesurvey.* TO 'limesurvey'@'localhost';
	# exit

