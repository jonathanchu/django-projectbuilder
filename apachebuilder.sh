#!/bin/bash
# Steve Phillips / elimisteve
# 2012.02.10

if [ -z $1 ]; then
    echo Usage: `basename $0` project_name
    exit 0
fi

PROJECT_NAME=$1

if [ `whoami` != "root" ]; then
    echo Must run as root
    exit 0
fi

# Generate new Apache config
python proto-new-virtualhost-subdomain.py $PROJECT_NAME > /etc/apache2/sites-available/$PROJECT_NAME
# Create symlink from sites-available to sites-enabled
cd /etc/apache2/sites-available/ && ln -s $PROJECT_NAME ../sites-enabled/$PROJECT_NAME
