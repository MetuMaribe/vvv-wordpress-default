#!/usr/bin/env bash
# Provision 

# Make a database, if we don't already have one
echo -e "\nCreating database 'homestead' (if it's not already there)"
mysql -u root --password=root -e "CREATE DATABASE IF NOT EXISTS homestead"
mysql -u root --password=root -e "GRANT ALL PRIVILEGES ON homestead.* TO wp@localhost IDENTIFIED BY 'wp';"
echo -e "\n DB operations done.\n\n"

# Nginx Logs
mkdir -p ${VVV_PATH_TO_SITE}/log
touch ${VVV_PATH_TO_SITE}/log/error.log
touch ${VVV_PATH_TO_SITE}/log/access.log

# Install and configure the latest stable
if [[ ! -d "${VVV_PATH_TO_SITE}/public_html" ]]; then

  echo "Setting up"
  cd ${VVV_PATH_TO_SITE}
  mkdir ${VVV_PATH_TO_SITE}/public_html
  touch ${VVV_PATH_TO_SITE}/public_html/index.php

else

  echo "Didn't workout"

fi
