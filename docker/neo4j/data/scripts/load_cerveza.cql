// path/to/neo4j/bin/neo4j-shell < load_cerveza.cql

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS
FROM 'file:///data/csvdata/cervezamvdeo_point.csv' 
AS line
MERGE (v:Vendedores {v_id: line.id, v_nombre: line.name, v_tipo: line.venue_type, v_foursquare_id: line.foursquare_id, v_foursquare_url: line.foursquare_url })
SET v.v_wkt = line.point_wkt, v.v_direccion = line.address, v.v_telefono = line.phone, v.v_email = line.email, v.v_web = line.web;