import random

def listPartitions(m,n,k):
    v=[]
    for f in range(0,min(m,n,k)+1):
        for d in range(0,min(m-f,n-f)+1):
            for e in range(0, min(n-f-d,k-f)+1):
                v.append((m-d-f,n-d-e-f,k-e-f,d,e,f))
    return v

def Partition(m,n,k):
    v=0
    for f in range(0,min(m,n,k)+1):
        for d in range(0,min(m-f,n-f)+1):
            for e in range(0, min(n-f-d,k-f)+1):
                v=v+1
    return v

def qPoly(m,n,k):
    v=0 
    q=var('q')
    for f in range(0,min(m,n,k)+1):
        for d in range(0,min(m-f,n-f)+1):
            for e in range(0, min(n-f-d,k-f)+1):
                v+=q^(m+n+k-2*f-e-d)
    return v

def checkPoly(m,n,k):
    if(Partition(m,n,k)==sum(qPoly(m,n,k).list())):
        pass
    else:
        print("Error: partitions not equal.")


# m,k => n
def caseOne(m,n,k,t):
    L=min(floor(t/2), n-ceil(t/2))
    return sum([2*j+t%2+1 for j in range(0,L+1)])


# m => n => k
def caseTwo(m,n,k,t):
    B= min(floor(t/2),k)
    A= max(t-n,0)
    L=B-A
    return sum([min((2*j+(t%2)), k-B+j)+1 for j in range(0,L+1)])

def hi():
    print('hello')

"""sum([2*j+t%2 for j in range(0,max(k-B-t%2,0))])+sum([k-B+j for j in range(max(0,k-B-t%2),L+1)])+L+1"""
def simplificationOne(m,n,k,t):
    B= min(floor(t/2),k)
    A= max(t-n,0)
    L=B-A
    i=k-B-t%2
    if(0<=i<=L):
       print("Case Two")
       return 1/2 * i*(i+1) + (t%2)*(i+1) + (L-i)*(k-B) + L/2 * (L+1) + L+1
    if(i>L):
        print("Case Three")
        return (L+1)*(L+t%2+1)
    if(i<L):
        print("Case One")
        return (L+1)*(2*k-2*B+L+2)/2

#m=<n=<k
def simplificationTwo(m,n,k,t):
    B= min(floor(t/2),m)
    A= max(t-n,0)
    L=B-A
    i=m-B-t%2
    if(0<=i<=L):
       print("Case Two")
       return 1/2 * i*(i+1) + (t%2)*(i+1) + (L-i)*(m-B) + L/2 * (L+1) + L+1
    if(i>L):
        print("Case Three")
        return (L+1)*(L+t%2+1)
    if(i<L):
        print("Case One")
        return (L+1)*(2*m-2*B+L+2)/2

def checkOne(m,n,k):
    for i in range(0,2*n+1):
        print(caseOne(m,n,k,i))

def checkTwo(m,n,k):
    for i in range(0,n+k+1):
        print(caseTwo(m,n,k,i))

def checkSimpleOne(m,n,k):
    for i in range(0,n+k+1):
        print(simplificationOne(m,n,k,i))

def checkSimpleTwo(m,n,k):
    for i in range(0,m+n+1):
        print(simplificationTwo(m,n,k,i))

def massPolyCheck():
    for i in range(0,random.randint(0,1000)):
        checkPoly(random.randint(0,1000)+i,random.randint(0,1000)+i,random.randint(0,1000)+i)

def massSimpleCheck():
    for i in range(0,random.randint(0,1000)):
        checkPoly(random.randint(0,1000)+i,random.randint(0,1000)+i,random.randint(0,1000)+i)

# Reload file in interactive Sage environment
def rl():
    load('partitions.sage')
