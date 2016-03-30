# 命令行导入database

* 下载
```
wget https://raw.githubusercontent.com/YunYinORG/database/master/yunyin.sql
```

* 创建 create.sql
```
DROP DATABASE IF EXISTS yunyin;
CREATE DATABASE yunyin DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
use yunyin;
set names utf8;
source yunyin.sql;
```

* 导入
```
mysql -u root -p mysql<create.sql
```
