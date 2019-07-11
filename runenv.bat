@echo off
echo "install chocolaty:"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

echo "install xinpujing dependency:"
echo "安装MAVEN:"
choco install -y maven
echo "安装GIT:"
choco install -y git
echo "安装redis-64:"
choco install -y redis-64
echo "安装telnet:"
choco install -y telnet
echo "安装vscode:"
choco install -y vscode
echo "刷新环境变量:"
refreshenv

cd %UserProfile%
d:
c:
echo "复制远程仓库代码到本地:"
echo "创建git本地仓库:"
mkdir gitRepos
cd gitRepos
echo "复制远程仓库config : git clone xinpujing_config:"
git clone https://github.com/nengbowan/xinpujing_config.git
echo "复制远程仓库web : git clone xinpujing_web:"
git clone https://github.com/nengbowan/xinpujing_web.git
echo "复制远程仓库admin : git clone xinpujing_admin:"
git clone https://github.com/nengbowan/xinpujing_admin.git
echo "复制远程仓库work : git clone xinpujing_work:"
git clone https://github.com/nengbowan/xinpujing_work.git
echo "复制远程仓库caiji : git clone xinpujing_caiji:"
git clone https://github.com/nengbowan/xinpujing_caiji.git
echo "复制远程仓库代码到本地成功!"


echo "install btSoft:"

start http://www.bt.cn/Download/btsoft.html

echo "请安装宝塔,并安装数据库,版本5.7,密码设置为root2019,安装完成按enter:"

echo "请设置mysql连接数,group_by_only参数:"


echo "set @@global.max_connections=999;"

echo "set @@sql_mode = "STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION";"

echo "set @@global.sql_mode = "STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION";"


echo "设置global.group_by_only数据库参数完成后,请按enter:"

cd xinpujing_web
echo "打包项目web开始:"
start cmd /k "mvn tomcat7:run-war -DskipTests=true"
echo  start cmd /k  mvn tomcat7:run-war -DskipTests=true   > web.bat
echo "打包项目admin开始:"
cd ../xinpujing_admin
start cmd /k "mvn tomcat7:run-war -DskipTests=true"
echo  start cmd /k  mvn tomcat7:run-war -DskipTests=true   > admin.bat
echo "打包项目work开始:"
cd ../xinpujing_work
echo start cmd /k  mvn tomcat7:run-war -DskipTests=true   > work.bat
start cmd /k "mvn tomcat7:run-war -DskipTests=true"
echo "打包项目caiji开始:"
cd ../xinpujing_caiji
echo  start cmd /k  mvn spring-boot:run -DskipTests=true   > caiji.bat
start cmd /k "mvn spring-boot:run -DskipTests=true"

echo "程序运行完毕."

echo "请将生成的快捷运行方式复制到桌面:"

echo "运行redis:"
start cmd /k "redis-server"
