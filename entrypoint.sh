#!/bin/sh

if [ ! -e /yapi/log/init.lock ]; then
    yarn run install-server
fi

touch /yapi/log/init.lock
yarn run start
