<<<<<<< HEAD
    # We are working in the Lie algebra of type A_r
r = 3

#Q.<m,n,k,c1,c2,c3> = QQ['m','n', 'k', 'c_1', 'c_2', 'c_3']
#Q = SR
var('m n k c1 c2 c3')

def ambient_to_vector(v):
    return matrix([v[i] for i in range(0,4)],ring=SR).transpose()


#R = RootSystem(['A', 3])
#space = R.root_lattice()
#a = space.simple_roots()
#alpha = space.simple_coroots()

W = WeylGroup(['A', 3], prefix='s')
alpha = W.domain().simple_roots()
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
root_matrix = matrix([vector_to_list(a[i]) for i in range(1,4)],ring=SR).transpose()

#W = WeylGroup(['A', 3], prefix='s')
#L = W.domain()
#P = L.positive_roots()
#a = L.simple_roots().list()
=======
def init():
    # We are working in the Lie algebra of type A_r
    r = 3

    # Initialize symbolic variables
    # for coefficients of lambda and mu
    var('m n k c1 c2 c3 x y z')

    # Initialize Weyl group and root system
    global W,a,p,s1,s2,s3,e
    W = WeylGroup(['A', 3], prefix='s')
    a = W.domain().simple_roots()
    P = W.domain().positive_roots()
    [s1,s2,s3] = W.simple_reflections()
    e = s1*s1

    # Initialize alpha 1, 2, and 3 as column matrices over SR
    global a1,a2,a3
    a1 = ambient_to_vector(a[1])
    a2 = ambient_to_vector(a[2])
    a3 = ambient_to_vector(a[3])

    # Initialize omega 1,2,3 as column matrices over SR
    global w1,w2,w3
    w1 = (1/4) * (3*a1 + 2*a2 + 1*a3)
    w2 = (1/2) * (1*a1 + 2*a2 + 1*a3)
    w3 = (1/4) * (1*a1 + 2*a2 + 3*a3)

    # Initialize rho, mu, lambda as column matrices over SR
    global rho,lam,mu
    rho = ambient_to_vector((1/2) * sum(P))
    lam = m*w1 + n*w2 + k*w3
    mu = c1*w1 + c2*w2 + c3*w3

    # Matrix where columns are the alpha's
    global root_matrix
    root_matrix = matrix([ambient_to_list(a[i]) for i in range(1,4)],ring=SR).transpose()

    # Substitutions of m,n,k in terms of x,y,z,c1,c2,c3 to ensure that alpha coefficients
    # in partition function input are integers for integral x,y,z
    global sub_1, sub_s1, sub_s2, sub_s3
    sub_1 = matrix([[3,2,1],[1,2,1],[1,2,3]],ring=SR).solve_right(vector([4*x+3*c1+2*c2+c3,2*y+c1+2*c2+c3,4*z+c1+2*c2+3*c3]))
    sub_s1 = matrix([[-1,2,1],[1,2,1],[1,2,3]],ring=SR).solve_right(vector([4*x + 3*c1 + 2*c2 + c3, 2*y + c1 + 2*c2 + c3, 4*z + c1 + 2*c2 + 3*c3]))
    sub_s2 = matrix([[3,2,1],[1,0,1],[1,2,3]],ring=SR).solve_right(vector([4*x+3*c1+2*c2+c3,2*y+c1+2*c2+c3,4*z+c1+2*c2+3*c3]))
    sub_s3 = matrix([[3,2,1],[1,2,1],[1,2,-1]],ring=SR).solve_right(vector([4*x+3*c1+2*c2+c3,2*y+c1+2*c2+c3,4*z+c1+2*c2+3*c3]))

    # sigma(lam+rho) - (rho + mu) with integrality substitutions for m,n,k
    # applied
    global sub_1_result, sub_s1_result, sub_s2_result, sub_s3_result
    sub_1_result = weyl_actions_sub(*sub_1);
    sub_s1_result = weyl_actions_sub(*sub_s1);
    sub_s2_result = weyl_actions_sub(*sub_s2);
    sub_s3_result = weyl_actions_sub(*sub_s3);

    global sub_1_callable, xyz_to_mnk
    sub_1_callable = [[fast_callable(p[1][i][0], vars=[x,y,z,c1,c2,c3]) for i in range(0,3)] for p in sub_1_result]
    xyz_to_mnk = [fast_callable(X, vars=[x,y,z,c1,c2,c3]) for X in sub_1]


# Computes the points of intersection between the hyperplanes determined
# by each Weyl group element (6-dimensional in x,y,z,c1,c2,c3)
def computePts():
    global mats, vecs, pts
    rows = [[1,0,0,0,0,0],[-1,-1,-1,0,0,-1],[-1,-1,0,0,-1,1],[-1,0,0,-1,1,0],[0,0,0,0,1,0],
            [-1,-2,-1,-1,0,0],[-1,-1,-1,-1,1,-1],[-1,-1,0,-1,0,1],[0,-1,-1,1,0,-1],
            [0,-1,0,1,-1,1],[0,0,0,0,0,1],[-1,-1,-1,-1,0,0],[0,-1,-1,1,-1,0],
            [0,0,-1,0,1,-1]]
    coeffs = [0,3,2,1,0,4,3,2,2,1,0,3,2,1]
    mats = []
    vecs = []
    for i1 in range(0,len(rows)):
        for i2 in range(0,i1):
            for i3 in range(0,i2):
                for i4 in range(0,i3):
                    for i5 in range(0,i4):
                        for i6 in range(0,i5):
                            M = matrix([rows[i1], rows[i2], rows[i3], rows[i4],
                                rows[i5], rows[i6]])
                            if(det(M) == 0):
                                continue;
                            mats.append(M)
                            vecs.append(vector([coeffs[i1], coeffs[i2], coeffs[i3],
                                coeffs[i4], coeffs[i5], coeffs[i6]]))
    pts = [mats[i].solve_right(vecs[i]) for i in range(0,len(mats))]
    for p in pts:
        p.set_immutable()

################################################################################
################################################################################
# Runs through all points (x_, y_, z_) for
# * x1 <= x_ < x2
# * y1 <= y_ < y2
# * z1 <= z_ < z2.
# Substitutes x_, y_, z_, c1_, c2_, c3_ into sub_1_result and determines
# which Weyl group elements yield non-negative alpha coefficients as a result
# (i.e. which Weyl group elements contribute).
# Possible contributing subsets of Weyl group elements are then conglomerated
# into a larger set, which is returned.
def give_me_subsets(x_range, y_range, z_range, c1_, c2_, c3_):
    alternation = set()
    for x_ in range(*x_range):
        for y_ in range(*y_range):
            for z_ in range(*z_range):
                thisone = set()
                for p in sub_1_result:
                    vec = p[1].substitute([x==x_, y==y_, z==z_, c1==c1_, c2==c2_, c3==c3_])
                    if(vec_nonnegative(vec)):
                        thisone.add(p[0])
                alternation.add(frozenset(thisone))
    return alternation


# Runs through all points (x_, y_, z_, c1_, c2_, c3_) for
# * x1 <= x_ < x2
# * y1 <= y_ < y2
# * z1 <= z_ < z2.
# * c1_1 <= c1_ < c1_2.
# * c2_1 <= c2_ < c2_2.
# * c3_1 <= c3_ < c3_2.
# Substitutes x_, y_, z_, c1_, c2_, c3_ into sub_1_result and determines
# which Weyl group elements yield non-negative alpha coefficients as a result
# (i.e. which Weyl group elements contribute).
# Possible contributing subsets of Weyl group elements are then conglomerated
# into a larger set, which is returned.
def give_me_subsets_6(x1, x2, y1, y2, z1, z2, c1_1, c1_2, c2_1,c2_2,c3_1,c3_2):
    alternation = set()
    for x_ in range(x1,x2):
        print(x_)
        for y_ in range(y1,y2):
            for z_ in range(z1,z2):
                for c1_ in range(c1_1,c1_2):
                    for c2_ in range(c2_1,c2_2):
                        for c3_ in range(c3_1,c3_2):
                            thisone = set()
                            for p in sub_1_result:
                                vec = p[1].substitute([x==x_, y==y_, z==z_, c1==c1_,
                                    c2==c2_, c3==c3_])
                                if(vec_nonnegative(vec)):
                                    thisone.add(p[0])
                            alternation.add(frozenset(thisone))
    return alternation


def give_me_subsets_par(x1, x2, y1, y2, z1, z2, c1_,c2_,c3_):
    pts = [(x_,y_,z_,c1_,c2_,c3_) for x_ in range(x1,x2) for y_ in range(y1,y2)
        for z_ in range(z1,z2)]
    lst = list(find_subset([pt for pt in pts]));
    alternation = {j[1] for j in lst}
    return alternation

# give_me_subsets but with the innermost for loop parallelized
def give_me_subsets_par_z(x1, x2, y1, y2, z1, z2, c1_,c2_,c3_):
    pts = [(x_,y_,b5,b6,c1_,c2_,c3_) for x_ in range(x1,x2) for y_ in range(y1,y2)]
    lst = list(find_subsets_z([pt for pt in pts]));
    alternation = [j[1] for j in lst]
    return set.union(*alternation)

# give_me_subsets_6 but with the innermost for loop parallelized
def give_me_subsets_par_z_6(x1, x2, y1, y2, z1, z2, c1_1,c1_2,c2_1,c2_2,c3_1,c3_2):
    pts = [(x_,y_,z1,z2,c1_,c2_,c3_) for x_ in range(x1,x2) for y_ in range(y1,y2)
            for c1_ in range(c1_1,c1_2) for c2_ in range(c2_1,c2_2)
            for c3_ in range(c3_1,c3_2)]
    lst = list(find_subsets_z([pt for pt in pts]));
    alternation = [j[1] for j in lst]
    return set.union(*alternation)


# give_me_subsets_6 but with the innermost for loop parallelized,
# and substitutions optimized
def give_me_subsets_par_z_6_op(x1, x2, y1, y2, z1, z2, c1_1,c1_2,c2_1,c2_2,c3_1,c3_2):
    pts = [(x_,y_,z1,z2,c1_,c2_,c3_) for x_ in range(x1,x2) for y_ in range(y1,y2)
            for c1_ in range(c1_1,c1_2) for c2_ in range(c2_1,c2_2)
            for c3_ in range(c3_1,c3_2)]
    lst = list(find_subsets_z_op([pt for pt in pts]));
    alternation = [j[1] for j in lst]
    return set.union(*alternation)


# give_me_subsets_6 but with the second innermost for loop parallelized,
# and substitutions optimized
def give_me_subsets_par_yz_6_op(x1, x2, y1, y2, z1, z2, c1_1,c1_2,c2_1,c2_2,c3_1,c3_2):
    pts = [(x_,y1,y2,z1,z2,c1_,c2_,c3_) for x_ in range(x1,x2)
            for c1_ in range(c1_1,c1_2) for c2_ in range(c2_1,c2_2)
            for c3_ in range(c3_1,c3_2)]
    lst = list(find_subsets_yz_op([pt for pt in pts]));
    alternation = [j[1] for j in lst]
    return set.union(*alternation)

# give_me_subsets_6 but with the outermost for loop parallelized,
# and substitutions optimized
def give_me_subsets_par_xyz_6_op(x1, x2, y1, y2, z1, z2, c1_1,c1_2,c2_1,c2_2,c3_1,c3_2):
    pts = [(x1,x2,y1,y2,z1,z2,c1_,c2_,c3_) for x_ in range(x1,x2)
            for c1_ in range(c1_1,c1_2) for c2_ in range(c2_1,c2_2)
            for c3_ in range(c3_1,c3_2)]
    lst = list(find_subsets_xyz_op([pt for pt in pts]));
    alternation = [j[1] for j in lst]
    return set.union(*alternation)

# give_me_subsets but with the second innermost for loop parallelized
def give_me_subsets_par_yz(b1, b2, b3, b4, b5, b6, c1_,c2_,c3_):
    pts = [(x_,b3,b4,b5,b6,c1_,c2_,c3_) for x_ in range(b1,b2)]
    lst = list(find_subsets_yz([pt for pt in pts]));
    alternation = [j[1] for j in lst]
    return set.union(*alternation)

# give_me_subsets_6 but with the second innermost for loop parallelized
def give_me_subsets_par_yz_6(x1, x2, y1, y2, z1, z2, c1_1,c1_2,c2_1,c2_2,c3_1,c3_2):
    pts = [(x_,y1,y2,z1,z2,c1_,c2_,c3_) for x_ in range(x1,x2) for c1_ in range(c1_1,c1_2)
            for c2_ in range(c2_1,c2_2) for c3_ in range(c3_1,c3_2)]
    lst = list(find_subsets_yz([pt for pt in pts]));
    alternation = [j[1] for j in lst]
    return set.union(*alternation)

# give_me_subsets_6 but with the outermost for loop parallelized
def give_me_subsets_par_xyz_6(x1, x2, y1, y2, z1, z2, c1_1,c1_2,c2_1,c2_2,c3_1,c3_2):
    pts = [(x1,x2,y1,y2,z1,z2,c1_,c2_,c3_) for x_ in range(x1,x2) for c1_ in range(c1_1,c1_2)
            for c2_ in range(c2_1,c2_2) for c3_ in range(c3_1,c3_2)]
    lst = list(find_subsets_yz([pt for pt in pts]));
    alternation = [j[1] for j in lst]
    return set.union(*alternation)

@parallel
def find_subset(x_,y_,z_,c1_,c2_,c3_):
    subset = set()
    for p in sub_1_result:
        vec = p[1].substitute([x==x_, y==y_, z==z_, c1==c1_, c2==c2_, c3==c3_])
        if(vec_nonnegative(vec)):
            subset.add(p[0])
    return frozenset(subset)

@parallel
def find_subsets_z(x_,y_,z1,z2,c1_,c2_,c3_):
    theset = set()

    for z_ in range(z1, z2):
        subset = set()
        for p in sub_1_result:
            vec = p[1].substitute([x==x_, y==y_, z==z_, c1==c1_, c2==c2_, c3==c3_])
            if(vec_nonnegative(vec)):
                subset.add(p[0])
        theset.add(frozenset(subset))
    return theset

@parallel
def find_subsets_z_op(x_,y_,z1,z2,c1_,c2_,c3_):
    theset = set()

    for z_ in range(z1, z2):
        subset = set()
        #for p in sub_1_callable:
        for i in range(0,len(sub_1_callable)):
            #vec = p[1].substitute([x==x_, y==y_, z==z_, c1==c1_, c2==c2_, c3==c3_])
            p = sub_1_callable[i]
            if(p[0](x_,y_,z_,c1_,c2_,c3_) >= 0 and p[1](x_,y_,z_,c1_,c2_,c3_)>=0
                    and p[2](x_,y_,z_,c1_,c2_,c3_)>=0):
                subset.add(sub_1_result[i][0])
        theset.add(frozenset(subset))
    return theset

@parallel
def find_subsets_yz_op(x_,y1,y2,z1,z2,c1_,c2_,c3_):
    theset = set()

    for y_ in range(y1, y2):
        for z_ in range(z1, z2):
            subset = set()
            #for p in sub_1_callable:
            for i in range(0,len(sub_1_callable)):
                #vec = p[1].substitute([x==x_, y==y_, z==z_, c1==c1_, c2==c2_, c3==c3_])
                p = sub_1_callable[i]
                if(p[0](x_,y_,z_,c1_,c2_,c3_) >= 0 and p[1](x_,y_,z_,c1_,c2_,c3_)>=0
                        and p[2](x_,y_,z_,c1_,c2_,c3_)>=0):
                    subset.add(sub_1_result[i][0])
            theset.add(frozenset(subset))
    return theset

@parallel
def find_subsets_xyz_op(x1,x2,y1,y2,z1,z2,c1_,c2_,c3_):
    theset = set()

    for x_ in range(x1, x2):
        for y_ in range(y1, y2):
            for z_ in range(z1, z2):
                subset = set()
                #for p in sub_1_callable:
                for i in range(0,len(sub_1_callable)):
                    #vec = p[1].substitute([x==x_, y==y_, z==z_, c1==c1_, c2==c2_, c3==c3_])
                    p = sub_1_callable[i]
                    if(p[0](x_,y_,z_,c1_,c2_,c3_) >= 0 and p[1](x_,y_,z_,c1_,c2_,c3_)>=0
                            and p[2](x_,y_,z_,c1_,c2_,c3_)>=0):
                        subset.add(sub_1_result[i][0])
                theset.add(frozenset(subset))
    return theset




@parallel
def find_subsets_yz(x_,y1,y2,z1,z2,c1_,c2_,c3_):
    theset = set()

    for y_ in range(y1,y2):
        for z_ in range(z1, z2):
            subset = set()
            for p in sub_1_result:
                vec = p[1].substitute([x==x_, y==y_, z==z_, c1==c1_, c2==c2_, c3==c3_])
                if(vec_nonnegative(vec)):
                    subset.add(p[0])
            theset.add(frozenset(subset))
    return theset

@parallel
def doit(o):
    return o^2

def vec_nonnegative(v):
    return all([b >= 0 for b in v]);
>>>>>>> 08cb1fd8bb23607fca3b88ea76d941fc93861218

# Gives us everything
def weyl_actions():
    return [(s,vector_to_alpha_coords(s.matrix() * (lam + rho) - (rho + mu))) for s in W]

def weyl_actions_sub(a,b,c):
    return [(s,vector_to_alpha_coords(s.matrix() * (lam + rho) - (rho + mu)).substitute([m==a,n==b,k==c])) for s in W]

#def weyl_actions_2():
#   return [(s,vector_to_alpha_coords(s.matrix() * (lam + rho) - rho )) for s in W]

#ef weyl_general(x, y):
#   return [(s,vector_to_alpha_coords(s.matrix() * x + y)) for s in W]

# Takes ambient space vector and converts to column matrix over SR
def ambient_to_list(v):
    return [v[i] for i in range(0,4)]

<<<<<<< HEAD
=======
# Takes vector and converts to a list
def vector_to_list(v):
    return [v[i] for i in range(0,4)]

# Takes ambient space vector and converts to column matrix over SR
def ambient_to_vector(v):
    return matrix([v[i] for i in range(0,4)],ring=SR).transpose()

>>>>>>> 08cb1fd8bb23607fca3b88ea76d941fc93861218

# Take R4 vector and gives coordinates in terms of alpha's
# v = c1 * a1 + c2 * a2 + c3 * a3
def ambient_to_alpha_coords(v):
    return root_matrix.solve_right(ambient_to_vector(v))


def vector_to_alpha_coords(v):
    return root_matrix.solve_right(v)

# Reloads this file.
# Used for convenience in Sage command line.
def rl():
    print('Reloading weightmult.sage...')
    load('weightmult.sage')
    init()



init()
