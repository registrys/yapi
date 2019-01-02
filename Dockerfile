FROM node:alpine
LABEL name="dingdayu <614422099@qq.com>"

ENV VERSION=master

RUN apk add --no-cache --virtual .gyp python curl make g++
RUN mkdir /yapi \
    && curl -sSL https://github.com/YMFE/yapi/archive/${VERSION}.tar.gz \
    | tar -xz -C /yapi && mv /yapi/yapi-master /yapi/vendors \
    && cp /yapi/vendors/config_example.json /yapi/config.json

WORKDIR /yapi/vendors
EXPOSE 3000

RUN npm install -g yapi-cli --registry https://registry.npm.taobao.org \
    && npm install --production --registry https://registry.npm.taobao.org

COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]
