#!/bin/sh

if [! -e /yapi//log/init.lock]; then
    npm run install-server
else
    touch /yapi//log/init.lock
    npm run start
fi