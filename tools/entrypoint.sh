#!/bin/sh

if [ ! -d "$(pwd)/node_modules" ] || [ -z "$(ls $(pwd)/node_modules)" ]; then
    if [ -e "$(pwd)/yarn.lock" ]; then
        /usr/local/bin/yarn install --pure-lockfile
        /usr/local/bin/yarn cache clean --force
    elif [ -e "$(pwd)/package.json" ]; then
        /usr/local/bin/npm install
        /usr/local/bin/npm cache clean --force
    fi
fi

if [ ! -d "$(pwd)/.nuxt" ]; then
    /usr/local/bin/npm run build
fi

if [ ! -z $@ ]; then
    if [ ! -z "$(which $1)" ]; then
        exec "$@"
    else
    	/usr/local/bin/npm run "$@"
    fi
elif [ -e "$(pwd)/package.json" ]; then
    /usr/local/bin/npm run start
fi