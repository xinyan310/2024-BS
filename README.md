# 商品比价网站
浙江大学2024BS体系结构课程设计



本地部署运行方式：

前端：frontend文件夹，需要配置**Node 16.13.2， 或者更高的版本**

1、打开 “flower-frontend” 目录

2、在”终端”执行命令：

npm config set registry https://registry.npmmirror.com

3、在”终端”执行命令：

npm install

4、在”终端”执行命令：

npm run dev

Java后端：backend文件夹，需要配置**JDK1.8、IDEA、Maven、Mysql5.7+**

1、打开IDEA后，选择 “open” 打开 “backend” 项目

2、IDEA配置好 “JDK1.8” 和 “Maven”，刷新等待编译成功

3、使用Navicat导入数据库文件 DB_flower.sql（backend文件夹下）

4、在”application.yml”中配置好数据库配置

5、在”application.yml”中配置图片路径“uploadPath”为你本地的路径

6、启动后端SpringBoot工程

python后端：app.py，需要配置**python环境3.11.6、pycharm**

1、打开pycharm，打开app.py

2、根据提示安装相应的包

3、在python环境中安装电脑chrome浏览器对应版本的驱动

4、运行app.py

本项目提供了云服务器部署，可以直接访问在线网址：http://8.154.32.233/

但是由于服务器环境的特殊性，不支持京东商品网站相关信息的爬取，本地部署可以正常使用这个功能

管理员登录的账号和密码：admin 123456

用户可以自由注册（注意要接受降价提醒邮件需要填写正确的邮箱地址）

也可以使用已有账号：maxinyan 123456
