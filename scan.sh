#!/bin/bash
/usr/bin/duc index -p -v -d /data/target.duc.db

#if [ `id -u` -eq '0' ]; then
#    chown www-data:www-data /data/target.duc.db
#fi