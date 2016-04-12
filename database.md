
主要内容
=====
基本思想
环境安装
账户和限制
自动运维

一.数据库管理指导思想
=========
1. **安全**
2. **稳定**
3. **高效**
4. 自动化
5. 方便

二.环境和安装
=========
操作系统 centos 7.x
数据库 MariaBD 5.5 (MySQL)
安装数据库
```
sudo yum install mariadb mariadb-server
```

账号和命令行测试
```
#启动数据库
sudo systemctl start mariadb
#重启
sudo systemctl restart mariadb.service
#设置 root密码等相关
mysql_secure_installation

#root 登录测试
mysql -uroot -p
```

三.账户和限制
=========

最小授权原则

|   账号  | 授权数据库 |  读写  | 网络访问 |  分类  |
| ------- | ---------- | ------ | -------- | ------ |
| root    | ALL (全部) |  读写  |   禁止   |  系统  |
| 管理员  | 以下全部   |  读写  | localhost|  管理  |
| 备份    | 以下全部   |  读    | localhost|  管理  |
| 浏览    | 以下全部   |  读    | localhost|  管理  |
| 云印    | yunyin     |  读写  | 内网指定 |  user  |
| 招领    | find       |  读写  | 内网指定 |  user  |


```
mysql -u root -p

CREATE USER 'admin'@'localhost' IDENTIFIED BY '管理员密码';
GRANT ALL ON yunyin.* TO 'admin'@'localhost' WITH GRANT OPTION;
GRANT SELECT,SHOW VIEW,LOCK TABLES ON yunyin.* TO 'backup'@'localhost';
GRANT DELETE,EVENT,EXECUTE,INSERT,LOCK TABLES,SELECT,UPDATE,SHOW VIEW ON yunyin.* TO '云印账号';
GRANT DELETE,EVENT,EXECUTE,INSERT,LOCK TABLES,SELECT,UPDATE,SHOW VIEW ON find.* TO '招领账号';
...

```
参见(http://yangfanweb.cn/管理-mariadb-用户账户/)[http://yangfanweb.cn/%E7%AE%A1%E7%90%86-mariadb-%E7%94%A8%E6%88%B7%E8%B4%A6%E6%88%B7/]

四.配置和运维
========

1.开机自启动
```
systemctl enable mariadb
```
2. 配置
```
sudo vim /etc/my.cnf
```
限制端口和外部开放
```
[mysqld]
port=1234
bind-address=0.0.0.0
```

3.数据导入导出
创建
```
CREATE DATABASE yunyin DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
```
导入
```
mysql -uroot -p yunyin<yunyin.sql
```
导出
```
mysqldump -ubackup -p yunyin | gzip >backup/yy.sql.gz;
```
4.定时备份

5.服务监视