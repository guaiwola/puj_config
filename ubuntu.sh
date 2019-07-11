#安装mysql
sudo apt-get install mysql-server mysql-client libmysqlclient-dev

#set password for root@localhost = password('root2019');

#导入sql
##set @@global.max_connections=999;
##set @@sql_mode = "STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION";
##set @@global.sql_mode = "STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION";
#exit;

#安装maven
sudo apt install maven -y

#安装git 已自带

#安装redis
sudo apt-get install redis-server -y


cd $HOME
mkdir gitRepos
cd gitRepos

#下载代码
#配置
#前端
#后台
#开奖
#采集
#内容管理
#代理
git clone https://github.com/nengbowan/xinpujing_config.git

git clone https://github.com/nengbowan/xinpujing_web.git

git clone https://github.com/nengbowan/xinpujing_admin.git

git clone https://github.com/nengbowan/xinpujing_work.git

git clone https://github.com/nengbowan/xinpujing_caiji.git

git clone https://github.com/nengbowan/cms_9001.git

git clone https://github.com/nengbowan/agent_7003.git

