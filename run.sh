#!/bin/bash

# debe estar conectar a internet para renderizar los mapas de Mapbox

echo "Levantar docker con neo4j: " 
cd docker/neo4j 
# levantar docker con neo4j
sudo docker-compose up -d
cd ../../pyserver
# levantar http server
echo "Levantar http server: " 
python3 -m http.server

# Para parar docker: sudo docker stop 56ca2aff20f7