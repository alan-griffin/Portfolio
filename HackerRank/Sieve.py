# Sieve of Eratosthenes - Practice
# Alan Griffin

def run_sieve(n):
    primes = sieve(n)
    print_output(primes, n)
    
def sieve(n):
    bool_range = [True for i in range(2,n)]
    for i in range(2,n):
        if bool_range[i-2] == True:
            p = i + i
            while p < n:
                bool_range[p-2] = False
                p = p + i                 
    return bool_range

def print_output(primes, n):
    for i in range(0, n-2):
        if primes[i] == True:
            print(i + 2)
    
run_sieve(40)    