def init():
    global W,a,P,a1,a2,a3,w1,w2,w3,rho,lam,mu,root_matrix,sub_1,sub_s1,sub_s2,sub_s3
    global sub_1_result,sub_s1_result,sub_s2_result,sub_s3_result
    # We are working in the Lie algebra of type A_r
    r = 3

    #Q.<m,n,k,c1,c2,c3> = QQ['m','n', 'k', 'c_1', 'c_2', 'c_3']

    #Q = SR
    var('m n k c1 c2 c3')

    #R = RootSystem(['A', 3])
    #space = R.root_lattice()
    #a = space.simple_roots()
    #alpha = space.simple_coroots()

    W = WeylGroup(['A', 3], prefix='s')
    a = W.domain().simple_roots()
    P = W.domain().positive_roots()
    #w = W.domain().fundamental_weights()

    # alpha 1,2,3
    a1 = ambient_to_vector(a[1])
    a2 = ambient_to_vector(a[2])
    a3 = ambient_to_vector(a[3])

    # omega 1,2,3
    #w1 = omega(1,r)
    #w2 = omega(2,r)
    #w3 = omega(3,r)
    w1 = (1/4) * (3*a1 + 2*a2 + 1*a3)
    w2 = (1/2) * (1*a1 + 2*a2 + 1*a3)
    w3 = (1/4) * (1*a1 + 2*a2 + 3*a3)

    # rho, mu, lambda
    rho = ambient_to_vector((1/2) * sum(P))
    lam = m*w1 + n*w2 + k*w3
    mu = c1*w1 + c2*w2 + c3*w3
    #mu = c1*a1 + c2*a2 + c3*a3

    # Matrix where columns are the alpha's
    root_matrix = matrix([ambient_to_list(a[i]) for i in range(1,4)],ring=SR).transpose()

    # Substitutions for integrality conditions
    sub_1 = matrix([[3,2,1],[1,2,1],[1,2,3]],ring=SR).solve_right(vector([4*x+3*c1+2*c2+c3,2*y+c1+2*c2+c3,4*z+c1+2*c2+3*c3]))
    sub_s1 = matrix([[-1,2,1],[1,2,1],[1,2,3]],ring=SR).solve_right(vector([4*x + 3*c1 + 2*c2 + c3, 2*y + c1 + 2*c2 + c3, 4*z + c1 + 2*c2 + 3*c3]))

    sub_1_result = weyl_actions_sub(*sub_1);
    sub_s1_result = weyl_actions_sub(*sub_s1);

#W = WeylGroup(['A', 3], prefix='s')
#L = W.domain()
#P = L.positive_roots()
#a = L.simple_roots().list()

# Gives us everything
def weyl_actions():
    return [(s,vector_to_alpha_coords(s.matrix() * (lam + rho) - (rho + mu))) for s in W]

def weyl_actions_sub(a,b,c):
    return [(s,vector_to_alpha_coords(s.matrix() * (lam + rho) - (rho + mu)).substitute([m==a,n==b,k==c])) for s in W]

#def weyl_actions_2():
#   return [(s,vector_to_alpha_coords(s.matrix() * (lam + rho) - rho )) for s in W]

#ef weyl_general(x, y):
#   return [(s,vector_to_alpha_coords(s.matrix() * x + y)) for s in W]

# Takes ambient space vector and converts to matrix
def ambient_to_list(v):
    return [v[i] for i in range(0,4)]

def vector_to_list(v):
    return [v[i] for i in range(0,4)]


def ambient_to_vector(v):
    return matrix([v[i] for i in range(0,4)],ring=SR).transpose()


# Take R4 vector and gives coordinates in terms of alpha's
# v = c1 * a1 + c2 * a2 + c3 * a3
def ambient_to_alpha_coords(v):
    return root_matrix.solve_right(ambient_to_vector(v))


def vector_to_alpha_coords(v):
    return root_matrix.solve_right(v)
    

# We wish to find the w's (omegas) #
# Finds omega_i for the Lie algebra of type A_l
def omega(i,l):
    return (l+1-i) / (l+1) * sum([j * a[j] for j in range(1,i)]) + i/(l+1)*sum([(l-j+1)*a[j] for j in range(i,l+1)])

def rl():
    load('weightmult.sage')
    init()


init()
