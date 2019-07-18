from sage.plot.plot3d.shapes2 import Line

load('weightmult.sage')
init()

weyl_group = list(W)


def alternation_diagram(sigmas, color):
    return (omega_plot(dist=15,color='black')
        + point_plot(dist=10, mu=(0,0,0), sigmas=sigmas, color=color)
        )


def cool_pic():
    return (omega_plot(dist=10,color='black')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[e], color='red')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s1], color='blue')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s2], color='green')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s3], color='yellow')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2], color='brown')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s2*s1], color='purple')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s3*s1], color='blueviolet')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s2*s3], color='cadetblue')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s3*s2], color='darkmagenta')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2*s3], color='darksalmon')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2*s1], color='firebrick')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s3*s2*s1], color='fuchsia')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s3*s1*s2], color='gold')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s2*s3*s1], color='greenyellow')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s2*s3*s2], color='darkturquoise')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2*s3*s1], color='lavender')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2*s3*s2], color='lightcoral')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s2*s3*s1*s2], color='navy')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s2*s3*s2*s1], color='olive')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s3*s1*s2*s1], color='plum')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2*s3*s2*s1], color='tan')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2*s3*s1*s2], color='tomato')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s2*s3*s1*s2*s1], color='yellowgreen')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2*s3*s1*s2*s1], color='violet')
        )

def omega_plot(dist, color):
    O1 = Line([(0,0,0), tuple(dist*wp1)], arrow_head=True, color=color)
    O2 = Line([(0,0,0), tuple(dist*wp2)], arrow_head=True, color=color)
    O3 = Line([(0,0,0), tuple(dist*wp3)], arrow_head=True, color=color)
    O1_label = text3d("w_1", tuple((dist+1.3)*wp1), color=(0,0,0))
    O2_label = text3d("w_2", tuple((dist+1.3)*wp2), color=(0,0,0))
    O3_label = text3d("w_3", tuple((dist+1.3)*wp3), color=(0,0,0))
    O1_negative = Line([(0,0,0), tuple(-dist*wp1)], arrow_head=True, color=color)
    O2_negative = Line([(0,0,0), tuple(-dist*wp2)], arrow_head=True, color=color)
    O3_negative = Line([(0,0,0), tuple(-dist*wp3)], arrow_head=True, color=color)
    return O1 + O2 + O3 + O1_negative + O2_negative + O3_negative + O1_label + O2_label + O3_label

def point_plot(dist, mu, sigmas, color, size=25):
    # Get the xyz coordinates
    c1_ = mu[0]
    c2_ = mu[1]
    c3_ = mu[2]
    sub1dict = dict(sub_1_result)
    coords_xyz = [
            (x_, y_, z_)
            for x_ in range(-dist, dist) for y_ in range(-dist, dist)
            for z_ in range(-dist, dist)
            if all( [
                sub_1_callable[list(sub1dict.keys()).index(s)][j](x_,y_,z_,c1_,c2_,c3_) >= 0
                for j in range(0,3) for s in sigmas])
        ]

    # Substitute in m,n,k
    coords_mnk = [tuple( [xyz_to_mnk[j](x_,y_,z_,c1_,c2_,c3_) for j in [0,1,2]] )
        for (x_,y_,z_) in coords_xyz]

    # Transform into omega coordinates
    coords_mnk_omega = [m_*wp1 + n_*wp2 + k_*wp3 for (m_,n_,k_) in coords_mnk]
    points = point3d(coords_mnk_omega, size, color=color, opacity=.5)
    return points

def point_plot_reversed(dist, mu, sigmas, color, size=10):
    # Get the xyz coordinates
    c1_ = mu[0]
    c2_ = mu[1]
    c3_ = mu[2]
    sub1dict = dict(sub_1_result)
    coords_xyz = [
            (x_, y_, z_)
            for x_ in range(-dist, dist) for y_ in range(-dist, dist)
            for z_ in range(-dist, dist)
            if all( [
                sub_1_callable[list(sub1dict.keys()).index(s)][j](x_,y_,z_,c1_,c2_,c3_) < 0
                for j in range(0,3) for s in sigmas])
        ]

    # Substitute in m,n,k
    coords_mnk = [tuple( [xyz_to_mnk[j](x_,y_,z_,c1_,c2_,c3_) for j in [0,1,2]] )
        for (x_,y_,z_) in coords_xyz]

    # Transform into omega coordinates
    coords_mnk_omega = [m_*wp1 + n_*wp2 + k_*wp3 for (m_,n_,k_) in coords_mnk]
    points = point3d(coords_mnk_omega, size, color=color, opacity=.5)
    return points

def center_plot(dist, mu, color, size=25):
    return point_plot_reversed(dist, mu, weyl_group, color, size)

def lattice_plot(dist):
    lines_xy = [
        Line( [ tuple(x_*wp1 + y_*wp2 - dist*wp3),
                tuple(x_*wp1 + y_*wp2 + dist*wp3) ],
              color=(.7,.7,.7),
              opacity=.1,
              thickness=.2)
        for x_ in range(-dist, dist)
        for y_ in range(-dist, dist)
    ]
    lines_xz = [
        Line( [ tuple(x_*wp1 - dist*wp2 + z_*wp3),
                tuple(x_*wp1 + dist*wp2 + z_*wp3) ],
              color=(.7,.7,.7),
              opacity=.1,
              thickness=.2)
        for x_ in range(-dist, dist)
        for z_ in range(-dist, dist)
    ]
    lines_yz = [
        Line( [ tuple(-dist*wp1 + y_*wp2 + z_*wp3),
                tuple(dist*wp1 + y_*wp2 + z_*wp3) ],
              color=(.7,.7,.7),
              opacity=.1,
              thickness=.2)
        for y_ in range(-dist, dist)
        for z_ in range(-dist, dist)
    ]
    return sum(lines_xy) + sum(lines_xz)

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
