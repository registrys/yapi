#!/bin/sh

if [ ! -e /yapi/log/init.lock ]; then
    npm run install-server
fi

touch /yapi/log/init.lock
npm run start
