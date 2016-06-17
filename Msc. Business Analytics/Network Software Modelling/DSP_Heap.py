# Dijkstra's shortest path algorithm implemented using heaps

import random
import networkx as nx
import numpy as np
from heapq import heappush, heappop


# Used to generate a complete graph of random weights 
def gen_graph(n):
    G = nx.complete_graph(n)
    for u, v in G.edges():
        G[u][v]["weight"] = random.randint(1,10)
    return G

def dijkstra(r, G):        
    for u, v in G.edges(): # All arc lengths must be positive
        if G[u][v]["weight"] <= 0:
            print "\nERROR: All arc lengths must be positive"            
            raise ValueError
    
    S = [] ; P = [] ; A = []
    heappush(P, (0, r, r)) # Push the root node to P
    for u in G.nodes(): # For each vertex, push priority, node and its parent
        if u != r:      # to S. If no edge between root and u, set to inf
            if (r, u) in G.edges():        
                heappush(S, (G[r][u]["weight"], u, r))
            else:
                heappush(S, (np.inf, u, r))        
    
    while S: # While S is not empty
        u = heappop(S) # Select u with min weight        
        heappush(P, u) # Add u to P
        heappush(A, (u[2], u[1])) # Add parent of u and u to A
        H = []
        
        for v in S: # Relaxation step
            if v[0] > (u[0] + G[u[1]][v[1]]["weight"]):
                w = u[0] + G[u[1]][v[1]]["weight"]                
                heappush(H, (w, v[1], u[1]))
            else:
                heappush(H, v)
        S = H # S is reset with any relaxed edges now included. Cannot 
              # directly change elements of heap, tuples are immuatable
    return A, P


G = gen_graph(10)
(T, P) = dijkstra(0,G) # 0 used as arbitrary choice for root

# Draw the tree returned by Dijkstra
G = nx.Graph()
for i in P:
    G.add_edge(i[1], i[2], weight=i[0])

# https://www.wakari.io/sharing/bundle/nvikram/Basics%20of%20Networkx?has_login=False
# Referenced for code to draw graph
pos=nx.spring_layout(G)
nx.draw(G, pos)
nx.draw_networkx_labels(G,pos,font_size=10,font_family='sans-serif')
weights = dict([((u,v,),int(d['weight'])) for u,v,d in G.edges(data=True)])
nx.draw_networkx_edge_labels(G,pos,edge_labels=weights)