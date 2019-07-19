load('diagrams.sage')


#THIS IS WHERE THE 24 ELEMENTS START
# a=sigmas=[e]
def diagram_e():
    return show(omega_plot(dist=20,color='black')
    + point_plot_fade(dist=10, mu=(0,0,0), sigmas=[e], color='red'), frame=False)

#b=sigmas=[s1]
def diagram_s1():
    return show(omega_plot(dist=20,color='black')
        + point_plot_fade(dist=10, mu=(0,0,0), sigmas=[s1], color='lightyellow'), frame=False)

#c=sigmas=[s2]
def diagram_s2():
    return show(omega_plot(dist=20,color='black')
        + point_plot_fade(dist=10, mu=(0,0,0), sigmas=[s2], color='green'), frame=False
        )

#d=sigmas=[s3]
def diagram_s3():
    return show(omega_plot(dist=20,color='black')
    + point_plot_fade(dist=10, mu=(0,0,0), sigmas=[s3], color='yellow'), frame=False
    )

#e=sigmas=[s1*s2]
def diagram_s1s2():
    return show(omega_plot(dist=20,color='black')
    + point_plot_fade(dist=10, mu=(0,0,0), sigmas=[s1*s2], color='orange'), frame=False
    )

#f=sigmas=[s2*s1]
def diagram_s2s1():
    return show(omega_plot(dist=20,color='black')
    + point_plot_fade(dist=10, mu=(0,0,0), sigmas=[s2*s1], color='purple'), frame=False
    )

#g=sigmas=[s3*s1]
def diagram_s3s1():
    return show(omega_plot(dist=20,color='black')
        + point_plot_fade(dist=10, mu=(0,0,0), sigmas=[s3*s1], color='blueviolet'), frame=False
        )

#h=sigmas=[s2*s3]
def diagram_s2s3():
    return show(omega_plot(dist=20,color='black')
        + point_plot_fade(dist=10, mu=(0,0,0), sigmas=[s2*s3], color='cadetblue'), frame=False
        )

#i=sigmas=[s3*s2]
def diagram_s3s2():
    return show(omega_plot(dist=20,color='black')
        + point_plot_fade(dist=10, mu=(0,0,0), sigmas=[s3*s2], color='cyan'),frame=False
        )

#j=sigmas=[s1*s2*s3]
def diagram_s1s2s3():
    return show(omega_plot(dist=20,color='black')
        + point_plot_fade(dist=10, mu=(0,0,0), sigmas=[s1*s2*s3], color='pink'), frame=False
        )

#k=sigmas=[s1*s2*s1]
def diagram_s1s2s1():
    return show(omega_plot(dist=20,color='black')
    + point_plot_fade(dist=10, mu=(0,0,0), sigmas=[s1*s2*s1], color='limegreen'), frame=False
    )

#l=sigmas=[s3*s2*s1]
def diagram_s3s2s1():
    return show(omega_plot(dist=20,color='black')
    + point_plot_fade(dist=10, mu=(0,0,0), sigmas=[s3*s2*s1], color='fuchsia'), frame=False
    )

#m=sigmas=[s3*s1*s2]
def diagram_s3s1s2():
    return show(omega_plot(dist=20,color='black')
    + point_plot_fade(dist=10, mu=(0,0,0), sigmas=[s3*s1*s2], color='gold'), frame=False
    )

#n=sigmas=[s2*s3*s1]
def diagram_s2s3s1():
    return show(omega_plot(dist=10,color='black')
    + point_plot_fade(dist=10, mu=(0,0,0), sigmas=[s2*s3*s1], color='greenyellow'), frame=False
    )

#o=sigmas=[s2*s3*s2]
def diagram_s2s3s2():
    return show(omega_plot(dist=20,color='black')
    + point_plot_fade(dist=10, mu=(0,0,0), sigmas=[s2*s3*s2], color='papayawhip'), frame=False
    )

#p=sigmas=[s1*s2*s3*s1]
def diagram_s1s2s3s1():
    return show(omega_plot(dist=20,color='black')
    + point_plot_fade(dist=10, mu=(0,0,0), sigmas=[s1*s2*s3*s1], color='lavender'), frame=False
    )

#q=sigmas=[s1*s2*s3*s2]
def diagram_s1s2s3s2():
    return show(omega_plot(dist=20,color='black')
    + point_plot_fade(dist=10, mu=(0,0,0), sigmas=[s1*s2*s3*s2], color='lightcoral'), frame=False
    )

#r=sigmas=[s2*s3*s1*s2]
def diagram_s2s3s1s2():
    return show(omega_plot(dist=20,color='black')
    + point_plot_fade(dist=10, mu=(0,0,0), sigmas=[s2*s3*s1*s2], color='navy'), frame=False
    )

#s=sigmas=[s2*s3*s2*s1]
def diagram_s2s3s2s1():
    return show(omega_plot(dist=20,color='black')
    + point_plot_fade(dist=10, mu=(0,0,0), sigmas=[s2*s3*s2*s1], color='olive'), frame=False
    )

#t=sigmas=[s3*s1*s2*s1]
def diagram_s3s1s2s1():
    return show(omega_plot(dist=20,color='black')
    + point_plot_fade(dist=10, mu=(0,0,0), sigmas=[s3*s1*s2*s1], color='plum'), frame=False
    )

#u=sigmas=[s1*s2*s3*s2*s1]
def diagram_s1s2s3s2s1():
    return show(omega_plot(dist=20,color='black')
    + point_plot_fade(dist=10, mu=(0,0,0), sigmas=[s1*s2*s3*s2*s1], color='tan'), frame=False
    )

#v=sigmas=[s1*s2*s3*s1*s2]
def diagram_s1s2s3s1s2():
    return show(omega_plot(dist=20,color='black')
    + point_plot_fade(dist=10, mu=(0,0,0), sigmas=[s1*s2*s3*s1*s2], color='tomato'), frame=False
    )

#w=sigmas=[s2*s3*s1*s2*s1]
def diagram_s2s3s1s2s1():
    return show(omega_plot(dist=20,color='black')
    + point_plot_fade(dist=10, mu=(0,0,0), sigmas=[s2*s3*s1*s2*s1], color='dimgrey'), frame=False
    )

#x=sigmas=[s1*s2*s3*s1*s2*s1]
def diagram_s1s2s3s1s2s1():
    return show(omega_plot(dist=20,color='black')
    + point_plot_fade(dist=10, mu=(0,0,0), sigmas=[s1*s2*s3*s1*s2*s1], color='lightgrey'), frame=False
    )

#the following give the outer shape of all the 24 weyl elements
mu_= (6,-3,0)
def cool_pic2():
    return show(omega_plot(dist=10,color='black')
        + point_plot(dist=10, mu=mu_, sigmas=[e], color='red')
        + point_plot(dist=10, mu=mu_, sigmas=[s1], color='blue')
        + point_plot(dist=10, mu=mu_, sigmas=[s2], color='green')
        + point_plot(dist=10, mu=mu_, sigmas=[s3], color='yellow')
        + point_plot(dist=10, mu=mu_, sigmas=[s1*s2], color='orange')
        + point_plot(dist=10, mu=mu_, sigmas=[s2*s1], color='purple')
        + point_plot(dist=10, mu=mu_, sigmas=[s3*s1], color='blueviolet')
        + point_plot(dist=10, mu=mu_, sigmas=[s2*s3], color='cadetblue')
        + point_plot(dist=10, mu=mu_, sigmas=[s3*s2], color='cyan')
        + point_plot(dist=10, mu=mu_, sigmas=[s1*s2*s3], color='pink')
        + point_plot(dist=10, mu=mu_, sigmas=[s1*s2*s1], color='limegreen')
        + point_plot(dist=10, mu=mu_, sigmas=[s3*s2*s1], color='fuchsia')
        + point_plot(dist=10, mu=mu_, sigmas=[s3*s1*s2], color='gold')
        + point_plot(dist=10, mu=mu_, sigmas=[s2*s3*s1], color='greenyellow')
        + point_plot(dist=10, mu=mu_, sigmas=[s2*s3*s2], color='papayawhip')
        + point_plot(dist=10, mu=mu_, sigmas=[s1*s2*s3*s1], color='lavender')
        + point_plot(dist=10, mu=mu_, sigmas=[s1*s2*s3*s2], color='lightcoral')
        + point_plot(dist=10, mu=mu_, sigmas=[s2*s3*s1*s2], color='navy')
        + point_plot(dist=10, mu=mu_, sigmas=[s2*s3*s2*s1], color='olive')
        + point_plot(dist=10, mu=mu_, sigmas=[s3*s1*s2*s1], color='plum')
        + point_plot(dist=10, mu=mu_, sigmas=[s1*s2*s3*s2*s1], color='tan')
        + point_plot(dist=10, mu=mu_, sigmas=[s1*s2*s3*s1*s2], color='tomato')
        + point_plot(dist=10, mu=mu_, sigmas=[s2*s3*s1*s2*s1], color='dimgrey')
        + point_plot(dist=10, mu=mu_, sigmas=[s1*s2*s3*s1*s2*s1], color='lightgrey'), frame=False
        )

#the following gives the shape of the empty space of all the 24 weyl elements
def cool_pic3(mu_a, dist=20, color='red', size=25):
    return (omega_plot(dist=dist,color='black')
        + center_plot(dist=dist,
        mu=(2*mu_a[0]-mu_a[1], -mu_a[0] + 2*mu_a[1] - mu_a[2],
        -mu_a[1] + 2*mu_a[2]), color=color, size=size))

def center_polytope(mu_a, dist=20, color='red', size=25):
    return (omega_plot(dist=dist,color='black')
        + center_polytope_plot(dist=dist,
        mu=(2*mu_a[0]-mu_a[1], -mu_a[0] + 2*mu_a[1] - mu_a[2],
        -mu_a[1] + 2*mu_a[2]), color=color, size=size))
