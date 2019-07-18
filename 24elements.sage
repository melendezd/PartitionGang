load('diagrams.sage')


#THIS IS WHERE THE 24 ELEMENTS START
# a=sigmas=[e]
def a():
    return (omega_plot(dist=10,color='black')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[e], color='red')
        )

#b=sigmas=[s1]
def b():
    return (omega_plot(dist=10,color='black')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s1], color='blue')
        )

#c=sigmas=[s2]
def c():
    return (omega_plot(dist=10,color='black')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s2], color='green')
        )

#d=sigmas=[s3]
def d():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s3], color='yellow')
    )

#sigmas=[s1*s2]
def e():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2], color='brown')
    )

#sigmas=[s2*s1]
def f():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s2*s1], color='purple')
    )

#sigmas=[s3*s1]
def g():
    return (omega_plot(dist=10,color='black')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s3*s1], color='blueviolet')
        )
    
#sigmas=[s2*s3]
def h():
    return (omega_plot(dist=10,color='black')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s2*s3], color='cadetblue')
        )

#sigmas=[s3*s2]
def i():
    return (omega_plot(dist=10,color='black')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s3*s2], color='darkmagenta')
        )

#sigmas=[s1*s2*s3]
def j():
    return (omega_plot(dist=10,color='black')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2*s3], color='darksalmon')
        )

#sigmas=[s1*s2*s1]
def k():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2*s1], color='firebrick')
    )

#sigmas=[s3*s2*s1]
def l():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s3*s2*s1], color='fuchsia')
    )

#sigmas=[s3*s1*s2]
def m():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s3*s1*s2], color='gold')
    )

#sigmas=[s2*s3*s1]
def n():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s2*s3*s1], color='greenyellow')
    )

#sigmas=[s2*s3*s2]
def o():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s2*s3*s2], color='darkturquoise')
    )

#sigmas=[s1*s2*s3*s1]
def p():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2*s3*s1], color='lavender')
    )

#sigmas=[s1*s2*s3*s2]
def q():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2*s3*s2], color='lightcoral')
    )

#sigmas=[s2*s3*s1*s2]
def r():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s2*s3*s1*s2], color='navy')
    )

#sigmas=[s2*s3*s2*s1]
def s():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s2*s3*s2*s1], color='olive')
    )

#sigmas=[s3*s1*s2*s1]
def t():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s3*s1*s2*s1], color='plum')
    )

#sigmas=[s1*s2*s3*s2*s1]
def u():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2*s3*s2*s1], color='tan')
    )

#sigmas=[s1*s2*s3*s1*s2]
def v():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2*s3*s1*s2], color='tomato')
    )

#sigmas=[s2*s3*s1*s2*s1]
def w():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s2*s3*s1*s2*s1], color='yellowgreen')
    )

#sigmas=[s1*s2*s3*s1*s2*s1]
def x():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2*s3*s1*s2*s1], color='violet')
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
