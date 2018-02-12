# HackerRank Practice
# Some practice code
# Alan Griffin
# Python Questions

# Swap the cases in a string
def SwapCase(S):
    if len(S) > 1000 or len(S) == 0:
        raise ValueError('Invalid Input')
    S = list(S)
    for i in range(len(S)):
        if str.islower(S[i]):
            S[i] = str.upper(S[i])
            continue
        if str.isupper(S[i]):
            S[i] = str.lower(S[i])  
    S = str.join('', S)                   
    return S

## Run SwapCase
#Str = 'HackerRank.com presents "Pythonist 2".'
#New_String = SwapCase(Str)
#print(New_String)


# Print out the grades of students who got the second lowest score
def NestedLists(n):
    if n < 2 or n > 5:
        raise ValueError('Invalid Input')
    students = get_input(n)
    s = sorted(students.items(), key = lambda x: x[1])
    print_second_lowest(s)

def get_input(n):
    students = dict() 
    for i in range(n):
        name = input()
        grade = input()
        students[name] = grade
    return(students)

def print_second_lowest(s):
    lowest = s[0][1]
    for i in range(len(s)):
        if s[i][1] != lowest:
            j = i
            lowest = s[i][1]
            break
    for i in range(j, len(s)):
        if s[i][1] == lowest:
            print(s[i])
            
#n = 3
#NestedLists(n)


# Print out the first N fibonacci numbers then their cubes
def fib(n):
    if n < 0 or n > 15:
        raise ValueError('Invalid Input')    
    fb_n = list()
    first = 0 ; second = 1
    fb_n.append(first)
    fb_n.append(second)
    
    for i in range(2, n):
        num = fb_n[i-1] + fb_n[i-2]
        fb_n.append(num)

    cube = lambda x : x**2
    fib_cubed = list(map(cube, fb_n))    
    return(fb_n, fib_cubed)

#(fib_normal, fib_cubed) = fib(7)



# Having been given a list of numbers, print the reversed numpy array
import numpy

def rev(L):
    L = numpy.array(L, float)
    L = list(reversed(L))
    return(L)

#L = [1,3,4,6,2]
#reversed_list = rev(L)
#print(reversed_list)



# Sort Table by a specified element - Bubble Sort used
import collections

def read():
    T = collections.defaultdict(list)
    n = int(input())
    if n < 1 or n > 1000:
        raise ValueError('Invalid Input')    
    m = int(input())
    if m < 1 or m > 1000:
        raise ValueError('Invalid Input')
    for i in range(n):
        for j in range(m):
            a = int(input())
            if a > 1000:
                raise ValueError('Invalid Input')
            T[i].append(a)
    k = int(input())
    if k < 1 or k > m:
        raise ValueError('Invalid Input')    
    return(T,n,k)

def sort_table(T,n,k):
    m = 1001
    index = 0
    T_new = collections.defaultdict(list)
    for i in range(n):
        for j in range(n): 
            if T[j][k] < m:
                m = T[j][k]
                index = j
        a = list(T[index])
        T_new[i].append(a)
        T[index][k] = 1001 ; m = 1001
    return(T_new)      

(T,n,k) = read()
T = sort_table(T,n,k)