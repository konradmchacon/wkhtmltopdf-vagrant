#!/bin/bash

$SET_X

MYSQL_PACKAGE="mysql-community-server"

export DOWNLOAD_DIR=/home/vagrant/downloads
mkdir -p $DOWNLOAD_DIR
chmod 774 $DOWNLOAD_DIR
chown vagrant:vagrant $DOWNLOAD_DIR

sudo apt-get update
sudo apt-get install lamp-server^

# --------------------------------------------
# install wkhtmltopdf
# --------------------------------------------
sed -i 's/enabled\=1/enabled\=0/' /etc/yum.repos.d/CentOS-SCL.repo

yum install -y urw-fonts
yum install -y xorg-x11-fonts-75dpi
yum install -y xorg-x11-fonts-Type1
wget http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-centos6-amd64.rpm
rpm -Uvh wkhtmltox-0.12.2.1_linux-centos6-amd64.rpm
  
  
# --------------------------------------------
# install LAMP for test
# --------------------------------------------
yum -y install httpd
yum -y localinstall /vagrant/vagrant/mysql/mysql57-community-release-el6-7.noarch.rpm
yum -y install $MYSQL_PACKAGE

# copy customized my.cnf file
cp -f /vagrant/vagrant/mysql/my.cnf /etc/my.cnf
cp -f /vagrant/vagrant/mysql/mysqld /etc/init.d/mysqld
yum -y install php php-mysql

chkconfig httpd on
chkconfig mysqld on

#copy test project code
ln -s /vagrant/vagrant/site-code/ /var/www/html/

if [ $INIT_MYSQL -eq 0 ]; then
  echo "Bypassing MySQL initialization."
  exit 0;
fi

# determine if password is required.  This can happen if we are running
# "vagrant provision" after the vagrant box was created.
mysql -uroot < /vagrant/vagrant/mysql/test-connection.sql
if [ $? -eq 1 ]; then
  ROOT_PASSWORD="-p12345678"
else
  ROOT_PASSWORD=""
fi

echo "Load database..."
mysql -uroot $ROOT_PASSWORD < /vagrant/vagrant/mysql/create-databases.sql
echo "database loaded."

echo "Initialize database"
mysql -uroot $ROOT_PASSWORD < /vagrant/vagrant/mysql/create-users.sql
echo "Database initialized."


# --------------------------------------------
# Turn off firewall
# --------------------------------------------
service iptables stop
chkconfig iptables off
service ip6tables stop
chkconfig ip6tables off

# --------------------------------------------
# Set up the vagrant user environment
# --------------------------------------------
if ! grep -q "/vagrant/vagrant/export.sh" "/home/vagrant/.bashrc"; then
  echo "source /vagrant/vagrant/export.sh" >> /home/vagrant/.bashrc
else
  echo "Export script already added .bashrc."
fi


