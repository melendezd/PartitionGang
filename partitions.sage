def listPartitions(m,n,k):
    v=[]
    for f in range(0,min(m,n,k)+1):
        for d in range(0,min(m-f,n-f)+1):
            for e in range(0, min(n-f-d,k-f)+1):
                v.append((m-d-f,n-d-e-f,k-e-f,d,e,f))
    return v


def qPoly(m,n,k):
    v=0
    q=var('q')
    for f in range(0,min(m,n,k)+1):
        for d in range(0,min(m-f,n-f)+1):
            for e in range(0, min(n-f-d,k-f)+1):
                v+=q^(m+n+k-2*f-e-d)
    return v


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

def simplificationOne(m,n,k,t):
    B= min(floor(t/2),k)
    A= max(t-n,0)
    L=B-A
    J=k-B-t%2
    if(0<=J<=L):
       print("Case Two")
       # return 1/2 * J*(J+1) + (t%2)*(J+1) + (L-J)*(k-B) + L/2 * (L+1) + L+1
       return -k**2/2 + k*(t%2) - 3/2*B*(t%2) - B/2 + B*k - B**2/2 - B*L + k*L + k/2 + B*(t%2)/2 + (L+1)*(L+2)/2    
    if(J>L):
        print("Case Three")
        return (L+1)*(L+t%2+1)
    if(J<L):
        print("Case One")
        return (L+1)*(2*k-2*B+L+2)/2

def checkOne(m,n,k):
    for i in range(0,2*n+1):
        print(caseOne(m,n,k,i))

def checkTwo(m,n,k):
    for i in range(0,n+k+1):
        print(caseTwo(m,n,k,i))

def checkSimple(m,n,k):
    for i in range(0,n+k+1):
        print(simplificationOne(m,n,k,i))

# Reload file in interactive Sage environment
def rl():
    load('partitions.sage')
