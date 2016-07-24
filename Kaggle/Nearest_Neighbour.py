# Digit Recognition on Kaggle
# Uses nearest neighbour approach

import numpy as np


train = np.genfromtxt('train_changed.csv', delimiter=',')
test  = np.genfromtxt('test_changed.csv', delimiter=',')

def create_dist_matrix():
    a = len(test)
    dist = np.zeros(shape=(a,a))
    return dist
        
    
def nn(dist):
    for i in range(1,28000):
        for j in range(1,42000):
            dist[i,j] = distance(i, j)
    return(dist)        

def distance(i, j):
    sum_dist = 0
    for k in range(0,784):
        sum_dist += np.abs(test[i, k] - train[j, k+1])
    return sum_dist    
            
def _get_distance_matrix():
    dist = create_dist_matrix()
    nn(dist)
    return dist
    
def gen_output_matrix():
    output_matrix = np.zeros(shape=(len(test),2))
    return output_matrix

def create_output():
    output_matrix = gen_output_matrix()
    for i in range(0,28000):
        output_matrix[i,0] = i
        index = np.argmin(distance_matrix[i])
        output_matrix[i,1] = train[index, 0]
    return output_matrix    
    
distance_matrix = _get_distance_matrix()
output = create_output()