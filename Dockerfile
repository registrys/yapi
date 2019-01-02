FROM node:alpine
LABEL name="dingdayu <614422099@qq.com>"

ENV VERSION=master

RUN mkdir -p /yapi/config \
    && apk add --no-cache --virtual .gyp python bash curl make g++ \
    && curl -sSL https://github.com/YMFE/yapi/archive/${VERSION}.tar.gz \
    | tar -xz -C /yapi && mv /yapi/yapi-master /yapi/vendors \
    && cp /yapi/vendors/config_example.json /yapi/config.json

WORKDIR /yapi/vendors
EXPOSE 3000

RUN npm install -g yapi-cli --registry https://registry.npm.taobao.org \
    && npm install --production --registry https://registry.npm.taobao.org


ENTRYPOINT ["entrypoint.sh"]