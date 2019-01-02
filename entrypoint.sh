#!/bin/sh

if [ ! -e /yapi/init.lock ]; then
    npm run install-server
fi

npm run start
