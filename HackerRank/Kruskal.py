# Alan Griffin

# Kruskal algorithm implemented using UnionFind data structure
# Initial Graph is created using randomized edges/weights within the function gen_graph
# n = 10 nodes and m = 30 edges used

# https://www.hackerrank.com/challenges/kruskalmstrsub

import networkx as nx
import networkx.utils as ut
import random


# Used to generate a non-complete graph of random weights with m edges 
def gen_graph(n, m):
    # Constraints provided in question:
    if n > 3000 or n < 2:
        print("ERROR: n must be with constraint bounds")
        raise ValueError
    if m < 1 or m > ((n * (n-1)) / 2):
        print("ERROR: m must be with constraint bounds")
        raise ValueError
    
    G = nx.Graph()
    for i in range(0,n-1): 
        G.add_node(i)
    while G.number_of_edges() < m: # Adds at least m edges to the graph
        u = random.randint(0,9) ; v = random.randint(0,9)
        if u == v and u == 9 :  # If statements used to avoid self-loops
            v = v - 1
        if u == v: 
            v = v + 1
        G.add_edge(u, v, weight = random.randint(1,20)) # Adds edges
    return G

def kruskal(G): # Need UnionFind libraries
    if G.is_directed(): # Kruskal works on undirected graphs
        print("ERROR: G must be an undirected graph")
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
        if nedges == nnodes - 1:
            break
    return T

# Enter value for n and m
G = gen_graph(10, 30)

# Run Kruskal's MST algorithm with UnionFind
T = kruskal(G)
print("MST from implementation of algorithm using UnionFind:")
print(T.nodes())
print(T.edges())
w = 0
for e in T.edges():
    w += T[e[0]][e[1]]['weight']
print ("MST weight =" , w)    

print("")

# Compare MST produced by our algorithm with that produced by NetworkX
T = nx.algorithms.kruskal_mst(G)
print("MST from NetworkX implementation of Kruskal's algorithm:")
print(T.nodes())
print(T.edges())
w = 0
for e in T.edges():
    w += T[e[0]][e[1]]['weight']
print ("MST weight =" , w) 