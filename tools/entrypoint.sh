#!/bin/sh

if [ -e "$(pwd)/yarn.lock" ]; then
    /usr/local/bin/yarn install --pure-lockfile
    /usr/local/bin/yarn cache clean --force
elif [ -e "$(pwd)/package.json" ]; then
    /usr/local/bin/npm install
    /usr/local/bin/npm cache clean --force
fi

if [ -d "$(pwd)/node_modules" ]; then
    chgrp -R users "$(pwd)"/node_modules
fi

if [ ! -z $@ ];then
    exec "$@"
elif [ -e "$(pwd)/package.json" ]; then
    /usr/local/bin/npm run start
fi