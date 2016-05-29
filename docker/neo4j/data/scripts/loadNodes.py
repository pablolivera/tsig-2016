import requests
from py2neo import Graph, authenticate

# set up authentication parameters
authenticate("localhost:7474", "neo4j", "pabl0")

# A Neo4j instance with Legis-Graph
graph = Graph("http://localhost:7474/db/data")
baseURI = "http://localhost:7474"
# this function will add a node to a spatial layer 
def addNodeToLayer(layer, nodeId):
    addNodeToLayerParams = {"node": baseURI+ "/db/data/node/" + str(nodeId), "layer": layer}
    r = requests.post(baseURI + "/db/data/ext/SpatialPlugin/graphdb/addNodeToLayer", json=addNodeToLayerParams, auth=('neo4j', 'pabl0'))
    
# Find Department nodes that have wkt property and are not part of the spatial index.
# Add these nodes to the layer
getIdsQuery = "MATCH (n:Departamentos) WHERE has(n.wkt) AND NOT (n)-[:RTREE_REFERENCE]-() RETURN id(n) AS n"
results = graph.cypher.execute(getIdsQuery)
for record in results:
    nodeId = record.n
    addNodeToLayer("geom", nodeId)
