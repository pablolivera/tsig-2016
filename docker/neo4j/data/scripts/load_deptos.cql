// path/to/neo4j/bin/neo4j-shell < load_deptos.cql

LOAD CSV WITH HEADERS
FROM 'file:///data/csvdata/coords4326.csv' AS line
MERGE (d:Departamentos {d_nombre: line.Departamento, d_capital: line.Capital, d_intendente: line.Intendente, d_subdivisiones: line.Subdivisiones, d_fundacion: line.Fundacion, d_superficie: line.Superficie, d_poblacion: line.Poblacion, d_densidad: line.Densidad, d_gentilicio: line.Gentilicio, d_matriculas_vehiculares: line.Matriculas_vehiculares })
SET d.wkt = line.WKT;
