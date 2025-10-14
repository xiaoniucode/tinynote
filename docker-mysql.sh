docker run --name mysql-server \
  -e MYSQL_ROOT_PASSWORD=123456 \
  -p 3306:3306 \
  -v /home/tinynote/mysql/data:/var/lib/mysql \
  -d mysql:5.7
