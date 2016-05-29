// path/to/neo4j/bin/neo4j-shell < load_relationship.cql

// WARNING
// line.department debe ser exactamente igual al nombre que esta cargado en la base para que funcione el match.

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS
FROM 'file:///data/csvdata/cervezamvdeo_point.csv'
AS line
MATCH (d:Departamentos {d_nombre: line.department }),
      (v:Vendedores { cv_id: line.id })
MERGE (v)-[:UBICADO_EN]->(d);