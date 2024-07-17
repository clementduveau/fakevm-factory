#!/bin/bash

cat << EOF > docker-compose.yml
services:
EOF

for i in $(seq 1 $1); do
  cat << EOF >> docker-compose.yml
  environment-$i:
    container_name: environment-$i
    hostname: environment-$i
    build: .
    stop_signal: SIGRTMIN+3
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:ro
    tmpfs:
      - /tmp
      - /run
      - /run/lock
    ports:
      - "0.0.0.0:$(( 8000 + $i )):7681"
    deploy:
      resources:
        limits:
          cpus: '1'
          memory: 2G
        reservations:
          cpus: '0.25'
          memory: 512M

EOF
done
