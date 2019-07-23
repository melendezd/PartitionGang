from sage.plot.plot3d.shapes2 import Line

load('weightmult.sage')
init()

weyl_group = list(W)


def alternation_diagram(sigmas, color):
    return (omega_plot(dist=15,color='black')
        + point_plot(dist=10, mu=(0,0,0), sigmas=sigmas, color=color))


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
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2*s3*s1*s2*s1], color='violet'))

def omega_plot(dist, color):
    O1 = Line([(0,0,0), tuple(dist*wp1)], arrow_head=True, color=color)
    O2 = Line([(0,0,0), tuple(dist*wp2)], arrow_head=True, color=color)
    O3 = Line([(0,0,0), tuple(dist*wp3)], arrow_head=True, color=color)
    O1_label = text3d("w_1", tuple((dist+1.3)*wp1), color=color)
    O2_label = text3d("w_2", tuple((dist+1.3)*wp2), color=color)
    O3_label = text3d("w_3", tuple((dist+1.3)*wp3), color=color)
    O1_negative = Line([(0,0,0), tuple(-dist*wp1)], arrow_head=True, color=color)
    O2_negative = Line([(0,0,0), tuple(-dist*wp2)], arrow_head=True, color=color)
    O3_negative = Line([(0,0,0), tuple(-dist*wp3)], arrow_head=True, color=color)
    return O1 + O2 + O3 + O1_negative + O2_negative + O3_negative + O1_label + O2_label + O3_label

def operation_1_plot():
    vec = Line([(0,0,0), tuple(ap1+ap2)], color='blue', arrow_head=True)
    vec_1 = Line([(0,0,0), tuple(ap1)], color='gray', arrow_head=True)
    vec_2 = Line([tuple(ap1), tuple(ap1+ap2)], color='gray', arrow_head=True)
    return vec + vec_1 + vec_2

def operation_2_plot():
    vec = Line([(0,0,0), tuple(ap2+ap3)], color='red', arrow_head=True)
    vec_1 = Line([(0,0,0), tuple(ap2)], color='gray', arrow_head=True)
    vec_2 = Line([tuple(ap2), tuple(ap2+ap3)], color='gray', arrow_head=True)
    return vec + vec_1 + vec_2

def operation_3_plot():
    vec = Line([(0,0,0), tuple(ap1+ap2+ap3)], color='green', arrow_head=True)
    vec_1 = Line([(0,0,0), tuple(ap1)], color='gray', arrow_head=True)
    vec_2 = Line([tuple(ap1), tuple(ap1+ap2)], color='gray', arrow_head=True)
    vec_3 = Line([tuple(ap1+ap2), tuple(ap1+ap2+ap3)], color='gray', arrow_head=True)
    return vec + vec_1 + vec_2 + vec_3

def partition_plot():
    vec = Line([(0,0,0), tuple(2*ap1+2*ap2+2*ap3)], color='violet', arrow_head=True)

    # First partition: al_1 + al_2 + al_3 + (al_1+al_2+al_3)
    #+al_1
    vec_1_2 = Line([(0,0,0), tuple(ap1)], color='gray', arrow_head=True)
    #+(a_1+al_2+al_3)
    vec_1_1 = Line([tuple(ap1), tuple(2*ap1+ap2+ap3)], color='green', arrow_head=True)
    #+al_2
    vec_1_3 = Line([tuple(2*ap1+ap2+ap3), tuple(2*ap1+2*ap2+ap3)], color='gray', arrow_head=True)
    #+al_3
    vec_1_4 = Line([tuple(2*ap1+2*ap2+ap3), tuple(2*ap1+2*ap2+2*ap3)], color='gray', arrow_head=True)

    # Second partition: al_1 + al_3 + (al_1+al_2) + (al_2+al_3)
    #+al_1
    vec_2_1 = Line([(0,0,0), tuple(ap1)], color='gray', arrow_head=True)
    #+al_3
    vec_2_2 = Line([tuple(ap1), tuple(ap1+ap3)], color='gray', arrow_head=True)
    #+(al_1+al_2)
    vec_2_3 = Line([tuple(ap1+ap3), tuple(2*ap1+ap2+ap3)], color='blue', arrow_head=True)
    #+(al_2+al_3)
    vec_2_4 = Line([tuple(2*ap1+ap2+ap3), tuple(2*ap1+2*ap2+2*ap3)], color='red', arrow_head=True)

    #return vec + vec_1_1 + vec_1_2 + vec_1_3 + vec_1_4
    return vec + vec_2_1 + vec_2_2 + vec_2_3 + vec_2_4

def positive_root_plot(dist, color, color1, color2, color3, thickness):
    t = thickness

    pO1 = tuple(ap1)
    pO_1 = tuple(-ap1)
    pO2 = tuple(ap2)
    pO_2 = tuple(-ap2)
    pO3 = tuple(ap3)
    pO_3 = tuple(-ap3)

    pO12 = tuple(ap1+ap2)
    pO1_2 = tuple(ap1-ap2)
    pO_12 = tuple(-ap1+ap2)
    pO_1_2 = tuple(-ap1-ap2)

    pO23 = tuple(ap2+ap3)
    pO2_3 = tuple(ap2-ap3)
    pO_23 = tuple(-ap2+ap3)
    pO_2_3 = tuple(-ap2-ap3)

    pO123 = tuple(ap1+ap2+ap3)
    pO_123 = tuple(-ap1+ap2+ap3)
    pO1_23 = tuple(ap1-ap2+ap3)
    pO12_3 = tuple(ap1+ap2-ap3)
    pO_1_23 = tuple(-ap1-ap2+ap3)
    pO1_2_3 = tuple(ap1-ap2-ap3)
    pO_12_3 = tuple(-ap1+ap2-ap3)
    pO_1_2_3 = tuple(-ap1-ap2-ap3)

    label_A1 = text3d("a_1", tuple((norm(ap1))*ap1), color=color1)
    label_A2 = text3d("a_2", tuple((norm(ap2))*ap2), color=color1)
    label_A3 = text3d("a_3", tuple((norm(ap3))*ap3), color=color1)
    label_A12 = text3d("a_1+a_2", tuple((norm(ap1+ap2))*(ap1+ap2)), color=color2)
    label_A23 = text3d("a_2+a_3", tuple((norm(ap2+ap3))*(ap2+ap3)), color=color2)
    label_A123 = text3d("a_1+a_2+a_3", tuple((norm(ap1+ap2+ap3))*(ap1+ap2+ap3)), color=color3)
    labels = label_A1 + label_A2 + label_A3 + label_A12 + label_A23 + label_A123

    verts = [pO1, pO_1, pO2, pO_2, pO3, pO_3, pO12, pO1_2, pO_12, pO_1_2,
    pO23, pO2_3, pO_23, pO_2_3, pO123, pO_123, pO1_23, pO12_3, pO_1_23,
    pO1_2_3, pO_12_3, pO_1_2_3]
    verts = [tuple(RDF(j) for j in v) for v in verts]

    O1 = Line([(0,0,0), tuple(ap1)], arrow_head=True, color=color1, thickness=t)
    O_1 = Line([(0,0,0), tuple(-ap1)], arrow_head=True, color=color1, thickness=t)
    O2 = Line([(0,0,0), tuple(ap2)], arrow_head=True, color=color1, thickness=t)
    O_2 = Line([(0,0,0), tuple(-ap2)], arrow_head=True, color=color1, thickness=t)
    O3 = Line([(0,0,0), tuple(ap3)], arrow_head=True, color=color1, thickness=t)
    O_3 = Line([(0,0,0), tuple(-ap3)], arrow_head=True, color=color1, thickness=t)

    O12 = Line([(0,0,0), tuple(ap1+ap2)], arrow_head=True, color=color2, thickness=t)
    O1_2 = Line([(0,0,0), tuple(ap1-ap2)], arrow_head=True, color=color, thickness=t)
    O_12 = Line([(0,0,0), tuple(-ap1+ap2)], arrow_head=True, color=color, thickness=t)
    O_1_2 = Line([(0,0,0), tuple(-ap1-ap2)], arrow_head=True, color=color2, thickness=t)


    O23 = Line([(0,0,0), tuple(ap2+ap3)], arrow_head=True, color=color2, thickness=t)
    O2_3 = Line([(0,0,0), tuple(ap2-ap3)], arrow_head=True, color=color, thickness=t)
    O_23 = Line([(0,0,0), tuple(-ap2+ap3)], arrow_head=True, color=color, thickness=t)
    O_2_3 = Line([(0,0,0), tuple(-ap2-ap3)], arrow_head=True, color=color2, thickness=t)

    O123 = Line([(0,0,0), tuple(ap1+ap2+ap3)], arrow_head=True, color=color3, thickness=t)
    O_123 = Line([(0,0,0), tuple(-ap1+ap2+ap3)], arrow_head=True, color=color, thickness=t)
    O1_23 = Line([(0,0,0), tuple(ap1-ap2+ap3)], arrow_head=True, color=color, thickness=t)
    O12_3 = Line([(0,0,0), tuple(ap1+ap2-ap3)], arrow_head=True, color=color, thickness=t)
    O_1_23 = Line([(0,0,0), tuple(-ap1-ap2+ap3)], arrow_head=True, color=color, thickness=t)
    O1_2_3 = Line([(0,0,0), tuple(ap1-ap2-ap3)], arrow_head=True, color=color, thickness=t)
    O_12_3 = Line([(0,0,0), tuple(-ap1+ap2-ap3)], arrow_head=True, color=color, thickness=t)
    O_1_2_3 = Line([(0,0,0), tuple(-ap1-ap2-ap3)], arrow_head=True, color=color3, thickness=t)


    #O1_label = text3d("a_1", tuple((dist+1.3)*ap1), color=color)
    #O2_label = text3d("a_2", tuple((dist+1.3)*ap2), color=color)
    #O3_label = text3d("a_3", tuple((dist+1.3)*ap3), color=color)
    #P = show(Polyhedron(vertices=verts))
    #P = point3d(verts, size=20)
    return (O1 + O_1 + O2 + O_2 + O3 + O_3 +
    O12 + O1_2 + O_12 + O_1_2 +
    O23 + O2_3 + O_23 + O_2_3 +
    O123 + O_123 + O1_23 + O12_3 +
    O_1_23 + O1_2_3 + O_12_3 + O_1_2_3
    + labels
    )

def simple_root_plot():
    pO1 = tuple(ap1)
    pO2 = tuple(ap2)
    pO3 = tuple(ap3)

    O1 = Line([(0,0,0), tuple(ap1)], arrow_head=True, color='red')
    O2 = Line([(0,0,0), tuple(ap2)], arrow_head=True, color='green')
    O3 = Line([(0,0,0), tuple(ap3)], arrow_head=True, color='blue')

    return O1+O2+O3

def normalPlane(vec, dist):
    tup = tuple(vec)
    plane = x*vec[0] + y*vec[1] + z*vec[2] == 0
    return implicit_plot3d(plane, (x, -dist, dist), (y,-dist,dist), (z,-dist,dist),opacity=.5)

def point_plot(dist, mu, sigmas, color, size=15):
    if(isinstance(color,basestring)):
        color = tuple(colors[color])
    else:
        color = color
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


def point_plot_fade(dist, mu, sigmas, color, size=15):
    # Get the xyz coordinates
    if(isinstance(color,basestring)):
        col = tuple(colors[color])
    else:
        col = color
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
    max_z = max([pt[2] for pt in coords_mnk_omega])
    min_z = min([pt[2] for pt in coords_mnk_omega])
    range_z = max_z-min_z
    points = [point3d(pt, size, color=tuple(col[j] * (max_z-pt[2]+0.1)/range_z for j in range(0,3)), opacity=.5) for pt in coords_mnk_omega]
    return sum(points)

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

def point_plot_reversed_polytope(dist, mu, sigmas, color, size=10):
    # Get the xyz coordinates
    c1_ = mu[0]
    c2_ = mu[1]
    c3_ = mu[2]
    sub1dict = dict(sub_1_result)
    coords_xyz = [
            (x_, y_, z_)
            for x_ in range(-dist, dist) for y_ in range(-dist, dist)
            for z_ in range(-dist, dist)
            if any( [
                sub_1_callable[list(sub1dict.keys()).index(s)][j](x_,y_,z_,c1_,c2_,c3_) == 0
                for j in range(0,3) for s in sigmas])
        ]

    # Substitute in m,n,k
    coords_mnk = [tuple( [xyz_to_mnk[j](x_,y_,z_,c1_,c2_,c3_) for j in [0,1,2]] )
        for (x_,y_,z_) in coords_xyz]

    # Transform into omega coordinates
    coords_mnk_omega = [m_*wp1 + n_*wp2 + k_*wp3 for (m_,n_,k_) in coords_mnk]
    coords_mnk_omega_rdf = [tuple(RDF(j) for j in i) for i in coords_mnk_omega]
    #points = point3d(coords_mnk_omega, size, color=color, opacity=.5)
    polytope = Polyhedron(vertices=coords_mnk_omega_rdf)
    return plot(polytope)

def center_plot(dist, mu, color, size=25):
    return point_plot_reversed(dist, mu, weyl_group, color, size)

def center_polytope_pts_plot(dist, mu, color, size=25):
    return point_plot_reversed(dist, mu, weyl_group, color, size)

#def center_polytope_plot(mu):
#    pts = getPolytopePts3d(mu)
#    pts_ = [[RDF(j) for j in v] for v in verts]
#    print(pts_)
#    return plot(Polyhedron(pts_))

def center_polytope_plot(mu, poly=False):
    #mu given as linear combo of w1, w2, w3
    #convert to actual coords
    polytope = getPolytope3d(mu)
    verts = polytope.vertices()
    verts = [tuple(v[0] * wp1 + v[1] * wp2 + v[2] * wp3) for v in verts]
    verts = [[RDF(j) for j in v] for v in verts]
    new_polytope = Polyhedron(verts)
    if(poly):
        return new_polytope
    return plot(new_polytope)

#def center_polytope_verts(mu, dist=10):
#    return (omega_plot(dist=dist, color='black')
#        + )

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

    global a1_, a2_, a3_
    a1_ = vector(a1.transpose())
    a2_ = vector(a2.transpose())
    a3_ = vector(a3.transpose())

    # Matrix whose rows are w1, w2, w3
    global omegas
    omegas = matrix([w1_, w2_, w3_], ring=QQ)

    # Matrix whose rows are a1, a2, a3
    global alphas
    alphas = matrix([a1_, a2_, a3_], ring=QQ)

    # bb is projection basis for omegas
    global bb, bbMat
    bb = gram_schmidt_symb(omegas)
    bbMat = matrix(bb).transpose()

    # alpha_projection is projection basis for alphas
    global alpha_projection_rows, alpha_projection_cols
    alpha_projection_rows = gram_schmidt_symb(alphas)
    alpha_projection_cols = matrix(alpha_projection_rows).transpose()

    global wp1, wp2, wp3
    wp1 = alpha_projection_cols.solve_right(w1_)
    wp2 = alpha_projection_cols.solve_right(w2_)
    wp3 = alpha_projection_cols.solve_right(w3_)

    global ap1, ap2, ap3
    ap1 = alpha_projection_cols.solve_right(a1_)
    ap2 = alpha_projection_cols.solve_right(a2_)
    ap3 = alpha_projection_cols.solve_right(a3_)

def gram_schmidt_symb(M):
    return [v.normalized() for v in M.gram_schmidt()[0].rows()]

def rl2():
    print('Reloading diagrams.sage...')
    load('diagrams.sage')

init_diagrams()
