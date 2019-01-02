#!/bin/sh

if [ ! -e /yapi/log/init.lock ]; then
    npm run install-server
else
    touch /yapi/log/init.lock
fi

npm run start
