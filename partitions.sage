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
       #print("Case Two")
       return 1/2 * i*(i+1) + (t%2)*(i+1) + (L-i)*(k-B) + L/2 * (L+1) + L+1
    if(i>L):
        #print("Case Three")
        return (L+1)*(L+t%2+1)
    if(i<L):
        #print("Case One")
        return (L+1)*(2*k-2*B+L+2)/2


#n>=m>=k, n>=m+k
def simplificationTwo(m,n,k,t):
    C2= min(floor(t/2),k)
    #C1= max(t-(m+k),0)
    #C1=0
    #A1=max(t-k-c,0)
    #A2=min(t-2*c,m-c)
    #return sum([(min(t-2*c,m-c)-max(t-k-c,0)+1) for c in range(0,C2+1)])
    if(t-m<0):
        #s1=sum([t-2*c for c in range(0,C2+1)])
        s1=(C2+1)*(t-C2)
    elif(0<=t-m<=C2):
        #s1=sum([m-c for c in range(0,t-m+1)])+sum([t-2*c for c in range(t-m+1,C2+1)])
        s1=(t-m+1)*(m-t)/2 + (C2+1)*(t-C2)
    #elif(t-m>C2):
        #s1=sum([m-c for c in range(0,t-m+1)])
        #s1=(m-c)*(C2+1)

    if(t-k<0):
        s2=0
    elif(0<=t-k<=C2):
        #s2=sum([t-k-c for c in range(0,t-k+1)])
        s2=(t-k)*(t-k+1)/2
    elif(t-k>C2):
        #s2=sum([t-k-c for c in range(0,C2+1)])
        s2=(C2+1)*(2*t-2*k-C2)/2
    return s1-s2+C2+1

    if(t-k<0):
        s2=0
    elif(0<=t-k<=C2):
        #s2=sum([t-k-c for c in range(0,t-k+1)])
        s2=(t-k)*(t-k+1)/2
    elif(t-k>C2):
        #s2=sum([t-k-c for c in range(0,C2+1)])
        s2=(C2+1)*(2*t-2*k-C2)/2
    return s1-s2+C2+1

#n>=m>=k, n<=m+k
def simplificationThree(m,n,k,t):
    C2= min(floor(t/2),k)
    C1= max(t-n,0)
    #A1=max(t-k-c,0)
    #A2=min(t-2*c,m-c)    
    return sum([(min(t-2*c,m-c)-max(t-k-c,0)+1) for c in range(C1,C2+1)])
    
#n>=m>=k, n<=m+k


def checkOne(m,n,k):
    p = 0
    for i in range(0,2*n+1):
        p += caseOne(m,n,k,i) * q**(m+n+k-i)
        #print(caseOne(m,n,k,i))
    return p

def checkTwo(m,n,k):
    for i in range(0,n+k+1):
        print(caseTwo(m,n,k,i))

def checkSimpleOne(m,n,k):
    p = 0
    for i in range(0,n+k+1):
        p += simplificationOne(m,n,k,i) * q**(m+n+k-i)
        #print(simplificationOne(m,n,k,i))
    return  p

def checkSimpleTwo(m,n,k):
    p = 0
    for i in range(0,k+m+1):
        p += simplificationTwo(m,n,k,i) * q**(m+n+k-i)
        #print(simplificationTwo(m,n,k,i))
    return p

def checkSimpleThree(m,n,k):
    p = 0
    for i in range(0,m+k+1):
        p += simplificationThree(m,n,k,i) * q**(m+n+k-i)
        #print(simplificationThree(m,n,k,i))
    return p

def massPolyCheck():
    for i in range(0,random.randint(0,1000)):
        checkPoly(random.randint(0,1000)+i,random.randint(0,1000)+i,random.randint(0,1000)+i)

def simpleDirect(m,n,k):
    if(m>=n and k>=n):
        sum=checkOne(m,n,k)
    elif(m>=n and n>=k):
        sum=checkSimpleOne(m,n,k)
    elif(n>=m and m>=k):
        if(n>=m+k):
            sum=checkSimpleTwo(m,n,k)
        else:
            sum=checkSimpleThree(m,n,k)
    elif(k>=n and n>=m):
        sum=checkSimpleOne(k,n,m)
    elif(n>=k and k>=m):
        if(n>=m+k):
            sum=checkSimpleTwo(k,n,m)
        else:
            sum=checkSimpleThree(k,n,m)
    return sum

def polyDiff(m,n,k):
    sum = qPoly(m,n,k)-simpleDirect(m,n,k)
    if(sum == 0):
        return True
    else:
        return (m,n,k) and False

def massPolyDiff():
    for i in range(0,random.randint(0,1000)):
        polyDiff(random.randint(0,1000)+i,random.randint(0,1000)+i,random.randint(0,1000)+i)
        if(False):
            break



# Reload file in interactive Sage environment
def rl():
    load('partitions.sage')
