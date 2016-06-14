### Información Geográfica en Bases NoSQL
Taller de Sistemas de Información Geográficos Empresariales (TSIG) - Facultad de Ingeniería - UdelaR.
  
  
  
####Demo
##### How to...
Sugerencia: utilizar VM OSGeo-Live y es necesario instalar docker.
Desde docker/neo4j ejecutar:
```
sudo docker-compose up
```
Cargar los datos de los csv (1. load_cerveza.cql 2. load_deptos.cql 3. load_relatopnships.cql) utilizando neo4jshell o desde la interfaz web.  
Cargar capa para utilizar los datos geográficos (una para puntos y otra para polígonos):
```
POST http://localhost:7474/db/data/ext/SpatialPlugin/graphdb/addEditableLayer
Payload:
{
"layer" : "geom" ,
"format" : "WKT" ,
"nodePropertyName" : "wkt"
}
```
Luego se deben agregar los nodos a las capas.  
Para ejecutar los scripts que agregan los nodos a las capas es necesario instalar:
```
sudo pip3.4 install py2neo
sudo pip3.4 install requests
```
Los scripts para ello son loadNodes.py y loadNodesVendedores.py. Revisar que la constraseña de neo4j sea la correcta.
```
python3.4 loadNodes.py
python3.4 loadNodesVendedores.py
```

Por último levantar el servidor http en el directrio pyserver:
```
python3 -m http.server
```
Luego desde el navegador: http://localhost:8000/index.html (Se debe contar con conexión a internet con los servidores de MapBox.com)
  
    
#### Referencias

- **[Neo4j](http://neo4j.com/)** Base de datos NoSQL orientada a grafos.
- **[neo4j-spatial](https://github.com/neo4j-contrib/spatial)** Plugin para datos geográficos.
- **[Mapbox JS](https://www.mapbox.com/mapbox.js/api/v2.3.0/)** Biblioteca javascript para mapas interactivos basada en Leaflet.
- **[Geospatial Indexing US Congressional Districts with Neo4j-spatial](http://neo4j.com/blog/geospatial-indexing-us-congress-neo4j/)** Artículo en el cual se basa el prototipo.
- **[Docker](https://www.docker.com/)** Contenedor.
- **[OSGeo-Live 9.5](https://live.osgeo.org/en/index.html)**
- **[Productores, puntos de venta y tipos de Cerveza Artesanal Uruguaya (Dondepinta.uy)](https://catalogodatos.gub.uy/dataset/productores-puntos-de-venta-y-tipos-de-cerveza-artesanal-uruguaya-dondepinta-uy)**

