# yapi

yapi 的 docker 镜像

## 引导

### 独立镜像方式

> 这里指将数据库和 `Yapi` 拆分开部署，默认您已经准备好可以使用的 `MongoDb` 数据库。

1、 克隆项目

```
clone https://github.com/registrys/yapi.git
```

> 以下步骤进入 `cd yapi` 目录。

2、 编辑配置文件

```
vi yapi/config.json
```

> 请在首次启动前修改配置，在 `yapi/config.json` 文件中配置对应的 `数据库`,`邮件`,`端口`,`管理账号`；首次启动将会自动建立数据库索引等信息。

3、 启动

`docker-compose` 启动：

```
docker-compose up -d
```

> 如需修改端口等信息，可自行编辑配置。

`docker` 启动

```
docker run -d -p 3000:3000 -v `pwd`/yapi/config.json:/yapi/config.json registrys/yapi
```

> 请注意此处的端口和文件挂载；`pwd` 取当前目录的绝对路径。

4、 测试

```
curl http://127.0.0.1:3000
```

> 或者通过浏览器访问对应的端口地址查看。