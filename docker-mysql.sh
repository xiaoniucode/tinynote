docker run -d \
  --name mysql57 \
  -p 3306:3306 \
  -e MYSQL_ROOT_PASSWORD=123456 \
  -v mysql_data:/var/lib/mysql \
  -v mysql_config:/etc/mysql/conf.d \
  --restart always \
  --add-host=host.docker.internal:host-gateway \
  mysql:5.7
