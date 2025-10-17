docker run -d \
  --restart always \
  -p 8080:8080 \
  --add-host=host.docker.internal:host-gateway \
  --name tinynote \
  -v /home/lighthouse/tinynote/app:/root tinynote:latest
