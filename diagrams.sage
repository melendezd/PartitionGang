from sage.plot.plot3d.shapes2 import Line

load('weightmult.sage')
init()

def omega_plot():
    O1 = Line([(0,0,0), tuple(wp1)], arrow_head=True)
    O2 = Line([(0,0,0), tuple(wp2)], arrow_head=True)
    O3 = Line([(0,0,0), tuple(wp3)], arrow_head=True)
    return O1+O2+O3

def point_plot(ran, c1_, c2_, c3_, h, col):
    # Get the xyz coordinates
    coords_xyz = [(x_, y_, z_)
        for x_ in range(*ran) for y_ in range(*ran) for z_ in range(*ran)
        if all( [sub_1_callable[h][j](x_,y_,z_,c1_,c2_,c3_) >= 0 for j in range(0,3)])]

    # Substitute in m,n,k
    coords_mnk = [tuple( [sub_1_callable[h][j](x_,y_,z_,c1_,c2_,c3_) for j in [0,1,2]] )
        for (x_,y_,z_) in coords_xyz]

    # Transform into omega coordinates
    coords_mnk_omega = [m_*wp1 + n_*wp2 + k_*wp3 for (m_,n_,k_) in coords_mnk]
    points = point3d(coords_mnk_omega, size=25, color=col, opacity=.5)
    return points


def init_diagrams():
    # Create omega column matrices over Q
    global w1_, w2_, w3_
    w1_ = vector(w1.transpose())
    w2_ = vector(w2.transpose())
    w3_ = vector(w3.transpose())

    # Matrix whose rows are w1, w2, w3
    global omegas
    omegas = matrix([w1_, w2_, w3_], ring=QQ)

    global bb, bbMat
    bb = gram_schmidt_symb(omegas)
    bbMat = matrix(bb).transpose()

    global wp1, wp2, wp3
    wp1 = bbMat.solve_right(w1_)
    wp2 = bbMat.solve_right(w2_)
    wp3 = bbMat.solve_right(w3_)

def gram_schmidt_symb(M):
    return [v.normalized() for v in M.gram_schmidt()[0].rows()]

def rl2():
    print('Reloading diagrams.sage...')
    load('diagrams.sage')

init_diagrams()
