#### install quexf ####

# get dependencies
sudo apt-get install build-essential -y

# sudo apt-get purge ghostscript
wget http://downloads.ghostscript.com/public/old-gs-releases/ghostscript-8.62.tar.gz
tar -xvzf ghostscript-8.62.tar.gz 
cd ghostscript-8.62/
./configure
make XCFLAGS=-DHAVE_SYS_TIME_H=1
sudo make install
cd ..

sudo apt-get install apache2 -y
sudo apt-get install apache2-utils -y

sudo apt-get install php5    -y
sudo apt-get install php5-gd -y
sudo apt-get install libphp-adodb php5-adodb -y

sudo apt-get install mysql-server -y

sudo apt-get install php5-mysql   -y


# install quexf 
rm download
wget https://sourceforge.net/projects/quexf/files/latest/download
unzip download
sudo mv quexf* /var/www/quexf
rm download


# install quexml
rm download
wget https://sourceforge.net/projects/quexml/files/latest/download
unzip download
sudo mv quexml* /var/www/quexml
rm download


# install tcpdf
rm download
wget https://sourceforge.net/projects/tcpdf/files/latest/download
unzip download
sudo mv tcpdf* /var/www/
rm download
sudo cp /var/www/tcpdf/examples/lang /var/www/tcpdf/config/lang -r


# setting file access rights for 
sudo chown -R www-data.www-data /var/www/quexf/ /var/www/quexml/ /var/www/tcpdf/
sudo chmod 774 /var/www/quexf/ /var/www/quexml/ /var/www/tcpdf/
sudo adduser konvena www-data

# configuration
sudo gedit /etc/php5/apache2/php.ini
	# upload_max_filesize = 10M
	# memory_limit = 128M
	# post_max_size = 10M
	# short_open_tag = On
	# max_input_vars = 10000


sudo gedit /etc/apache2/apache2.conf
	# <Directory "/var/www/quexf">
        #        AuthType Basic
        #        AuthName "quexf"
        #        AuthUserFile /etc/apache2/passwords
        #        Require user konvena
	# </Directory>
	# <Directory "/var/www/quexf/admin">
        #        AuthType Basic
        #        AuthName "quexf admin"
        #        AuthUserFile /etc/apache2/passwords
        #        Require user konvena
	# </Directory>
	# 
	# ServerName localhost

sudo gedit /etc/apache2/sites-available/000-default.conf
	# DocumentRoot /var/www/


sudo htpasswd -c /etc/apache2/passwords konvena

mysql -u root -p mysql
	# CREATE USER 'quexf'@'localhost' IDENTIFIED BY '>>PASSWORD<<';
	# CREATE DATABASE quexf;
	# GRANT ALL PRIVILEGES ON quexf.* TO 'quexf'@'localhost';
	# exit

cd /var/www/quexf
cp /var/www/quexf/database/quexf.sql quexf.sql
sudo mysql -u quexf -p quexf < quexf.sql
rm quexf.sql

sudo gedit /var/www/quexf/config.inc.php
	# define('DB_USER', 'quexf');
	# define('DB_PASS', 'some_password');
	# define('DB_HOST', 'localhost');
	# define('DB_NAME', 'quexf');
	# define('GS_BIN', "/usr/local/bin/gs");

sudo apache2ctl restart











