
docker run -d \
   --add-host=host.docker.internal:host-gateway \
   -p 8080:8080 \
   tinynote:1.0.2
