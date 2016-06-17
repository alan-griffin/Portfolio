# Networkx and Karate Club data

import networkx as nx
import Queue as qu
import numpy as np


# Data is placed in two queues, then added to a new graph
def data_to_graph(filename):
    G = nx.Graph()
    (Nodes, Edges) = read_data(filename)
    while not Nodes.empty():
        G.add_node(Nodes.get())
    while not Edges.empty():
        (u, v) = Edges.get()  
        G.add_edge(u, v)    
    return G
    
# Reads data on network into two queues
def read_data(filename):
    Nodes = qu.Queue()
    Edges = qu.Queue()
    f = open(filename, 'r') 
    s = f.readline()
    Nodes = process_nodes(s, Nodes)
    s = f.readline()
    Edges = process_edges(s, Edges)
    return Nodes,Edges
    
# Process each node and add it to the Queue
# Also removes unrequired data from string
def process_nodes(s, Nodes):    
    s = s.replace('nodes ', '')
    s = s.replace(';', ',')
    L = map(int, s.split(','))
    for i in L:
        Nodes.put(i)   
    return Nodes

# Process each edge and add it to the Queue
# Again, removes unrequired data from string
def process_edges(s, Edges):
    s = s.replace('edges ', '')
    s = s.replace(':', ',')
    s = s.replace(';', ',')
    L = map(int, s.split(','))
    for i in range(0,len(L),2):
        Edges.put((L[i], L[i+1]))
    return Edges

# Referenced from: 
# https://networkx.github.io/documentation/latest/reference/generated/networkx.algorithms.centrality.eigenvector_centrality.html
def eigen_centrality(G):
    print "\nEigenvetor centrality for all nodes:"    
    centrality = nx.eigenvector_centrality(G)
    print(['%s %0.2f'%(node,centrality[node]) for node in centrality])

# Places all shortest path lengths in a square matrix
def shortest_path_matrix(G):
    num = G.number_of_nodes()
    A = np.zeros((num, num))
    for i in xrange(A.shape[0]):
        for j in xrange(A.shape[1]):
            A[i][j] = nx.shortest_path_length(G, source=i, target = j)
    return A

# Creates .gexf file for Gephi
def graph_to_Gephi(G, filename):
    nx.write_gexf(G, filename)


G = data_to_graph('karate.dat')
eigen_centrality(G)
A = shortest_path_matrix(G)
print "\nSquare Matrix of Shortest Path Lengths:"
print A
graph_to_Gephi(G, 'karate_club.gexf')