#!/bin/bash

$SET_X

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
