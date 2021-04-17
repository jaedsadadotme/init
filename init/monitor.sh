#!/bin/bash

docker network create monitor || true
echo "create network success..."
echo "---------------------------"
docker run -d --name=node-exporter \
--network=monitor \
-p 9100:9100 prom/node-exporter:latest > /dev/null
echo "node-exportor..."
echo "---------------------------"
cat << EOF > prometheus.yml
# section 1
global: 
  scrape_interval: 5s
  external_labels:
    monitor: 'node-monitor'  
  
# section 2  
scrape_configs: 
  - job_name: prometheus
    static_configs: 
      - targets: ["127.0.0.1:9099"]
      
  - job_name: node-exporter
    static_configs:
     - targets: ["node-exporter:9100"]
EOF
echo "create prometheus.yml success..."
echo "---------------------------"

docker run -dp 9090:9090 --name prometheus \
--network=monitor \
-v $(pwd)/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus > /dev/null
echo "prometheus success..."
docker run -dp 3000:3000  \
--name=grafana \
--network=monitor \
-e "GF_SECURITY_ADMIN_PASSWORD=pingpong" grafana/grafana > /dev/null

echo "install grafana success..."
echo "---------------------------"
echo "username & password"
echo "username => admin"
echo "password => $1"
echo "---------------------------"
read -p "Press any key to continue... " -n1 -s
