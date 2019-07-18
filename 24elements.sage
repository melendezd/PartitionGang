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

#e=sigmas=[s1*s2]
def ee():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2], color='orange')
    )

#f=sigmas=[s2*s1]
def f():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s2*s1], color='purple')
    )

#g=sigmas=[s3*s1]
def g():
    return (omega_plot(dist=10,color='black')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s3*s1], color='blueviolet')
        )

#h=sigmas=[s2*s3]
def h():
    return (omega_plot(dist=10,color='black')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s2*s3], color='cadetblue')
        )

#i=sigmas=[s3*s2]
def i():
    return (omega_plot(dist=10,color='black')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s3*s2], color='cyan')
        )

#j=sigmas=[s1*s2*s3]
def j():
    return (omega_plot(dist=10,color='black')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2*s3], color='pink')
        )

#k=sigmas=[s1*s2*s1]
def k():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2*s1], color='limegreen')
    )

#l=sigmas=[s3*s2*s1]
def l():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s3*s2*s1], color='fuchsia')
    )

#m=sigmas=[s3*s1*s2]
def m():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s3*s1*s2], color='gold')
    )

#n=sigmas=[s2*s3*s1]
def n():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s2*s3*s1], color='greenyellow')
    )

#o=sigmas=[s2*s3*s2]
def o():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s2*s3*s2], color='papayawhip')
    )

#p=sigmas=[s1*s2*s3*s1]
def p():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2*s3*s1], color='lavender')
    )

#q=sigmas=[s1*s2*s3*s2]
def q():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2*s3*s2], color='lightcoral')
    )

#r=sigmas=[s2*s3*s1*s2]
def r():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s2*s3*s1*s2], color='navy')
    )

#s=sigmas=[s2*s3*s2*s1]
def s():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s2*s3*s2*s1], color='olive')
    )

#t=sigmas=[s3*s1*s2*s1]
def t():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s3*s1*s2*s1], color='plum')
    )

#u=sigmas=[s1*s2*s3*s2*s1]
def u():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2*s3*s2*s1], color='tan')
    )

#v=sigmas=[s1*s2*s3*s1*s2]
def v():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2*s3*s1*s2], color='tomato')
    )

#w=sigmas=[s2*s3*s1*s2*s1]
def w():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s2*s3*s1*s2*s1], color='dimgrey')
    )

#x=sigmas=[s1*s2*s3*s1*s2*s1]
def x():
    return (omega_plot(dist=10,color='black')
    + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2*s3*s1*s2*s1], color='lightgrey')
    )


def cool_pic2():
    return (omega_plot(dist=10,color='black')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[e], color='red')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s1], color='blue')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s2], color='green')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s3], color='yellow')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2], color='orange')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s2*s1], color='purple')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s3*s1], color='blueviolet')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s2*s3], color='cadetblue')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s3*s2], color='cyan')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2*s3], color='pink')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2*s1], color='limegreen')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s3*s2*s1], color='fuchsia')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s3*s1*s2], color='gold')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s2*s3*s1], color='greenyellow')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s2*s3*s2], color='papayawhip')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2*s3*s1], color='lavender')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2*s3*s2], color='lightcoral')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s2*s3*s1*s2], color='navy')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s2*s3*s2*s1], color='olive')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s3*s1*s2*s1], color='plum')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2*s3*s2*s1], color='tan')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2*s3*s1*s2], color='tomato')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s2*s3*s1*s2*s1], color='dimgrey')
        + point_plot(dist=10, mu=(0,0,0), sigmas=[s1*s2*s3*s1*s2*s1], color='lightgrey')
        )
