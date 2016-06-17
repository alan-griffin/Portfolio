# Kruskal using UnionFind

import networkx as nx
import networkx.utils as ut
import random


# Used to generate a non-complete graph of random weights with 30 edges 
def gen_graph(n):
    G = nx.Graph()
    for i in range(0,n-1): 
        G.add_node(i)
    while G.number_of_edges() < 30: # Adds at least 30 edges to the graph
        u = random.randint(0,9) ; v = random.randint(0,9)
        if u == v and u == 9 :  # If statements used to avoid self-loops
            v = v - 1
        if u == v: 
            v = v + 1
        G.add_edge(u, v, weight = random.randint(1,20)) # Adds edges
    return G

def kruskal(G): # Need UnionFind libraries
    if G.is_directed(): # Kruskal works on undirected graphs
        print "ERROR: G must be an undirected graph"
        raise ValueError
        
    T = nx.Graph() # Make a new graph T, and copy all nodes from G to T
    for n in G.nodes():
        T.add_node(n)
    
    # Consider all edges, ordered by weight
    edges = sorted(G.edges(data=True), key=lambda t: t[2].get("weight",1))
    nnodes = G.order()
    nedges = 0
    
    uf = ut.UnionFind() # New UnionFind data structure
    # For each edge: if it would create a cycle, don't add, otherwise do
    for e in edges:
        u1 = uf.__getitem__(e[0])
        u2 = uf.__getitem__(e[1])
        if u1 == u2: # If same root, skip
            continue
        else:
            # There is no such path, so adding e will not form a cycle
            uf.union(e[0], e[1])            
            T.add_edge(e[0], e[1], weight=e[2]["weight"])
            nedges += 1
        if nedges > nnodes - 1:
            break
    return T


G = gen_graph(10)
# Run Kruskal's MST algorithm with UnionFind
T = kruskal(G)
print "MST from our algorithm"
print T.nodes()
print T.edges()

T = nx.algorithms.kruskal_mst(G)
print "MST from NetworkX implementation of Kruskal's algorithm"
print T.nodes()
print T.edges()