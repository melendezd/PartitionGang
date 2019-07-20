W = WeylGroup(['A', 3], prefix='s')
[s1, s2, s3] = W.simple_reflections()
e=s1*s1

var('P Q R')
p = var('P1 P2 P3 P4')
q = var('Q1 Q2 Q3 Q4 Q5 Q6')
r = var('R1 R2 R3 R4')

[P1, P2, P3, P4] = p
[Q1, Q2, Q3, Q4, Q5, Q6] = q
[R1, R2, R3, R4] = r

pqr = p + q + r

alts = load('alts_mu_positive')

everything_zero = [var==0 for var in pqr]

def has_constant(expr):
    return Integer(expr.substitute(everything_zero)) != 0

def is_alone(expr, var):
    coeff = expr.coefficient(var,1)
    return coeff.substitute(everything_zero) == coeff

def should_be_false(expr, var):
    coeff = expr.coefficient(var,1)
    return has_constant(coeff)

positive_conds= {
  e:{ P:1, Q:1, R:1 },
  s1*s2*s1:{ P:3, Q:4, R:1 },
  s3:{ P:1, Q:1, R:4 },
  s1*s2:{ P:3, Q:6, R:1 },
  s2*s3:{ P:1, Q:5, R:4 },
  s1:{ P:4, Q:1, R:1 },
  s2*s3*s2:{ P:1, Q:5, R:3 },
  s2*s1:{ P:4, Q:4, R:1 },
  s3*s1:{ P:4, Q:6, R:3 },
  s3*s2:{ P:1, Q:6, R:3 },
  s2:{ P:1, Q:6, R:1 },
  s3*s1*s2:{ P:3, Q:6, R:3 }
}

all_conds = {
  e:{ P:1, Q:1, R:1 },
  s1*s2*s3*s2*s1:{ P:2, Q:3, R:2 },
  s1*s2*s3*s1:{ P:2, Q:3, R:4 },
  s1*s2*s3*s2:{ P:2, Q:5, R:3 },
  s1*s2*s1:{ P:3, Q:4, R:1 },
  s3*s1*s2*s1:{ P:3, Q:4, R:2 },
  s3:{ P:1, Q:1, R:4 },
  s3*s1*s2:{ P:3, Q:6, R:3 },
  s1*s2:{ P:3, Q:6, R:1 },
  s2*s3*s1*s2*s1:{ P:3, Q:2, R:2 },
  s2*s3:{ P:1, Q:5, R:4 },
  s2*s3*s1*s2:{ P:3, Q:2, R:3 },
  s1:{ P:4, Q:1, R:1 },
  s2*s3*s2*s1:{ P:4, Q:3, R:2 },
  s2*s3*s1:{ P:4, Q:3, R:4 },
  s2*s3*s2:{ P:1, Q:5, R:3 },
  s2*s1:{ P:4, Q:4, R:1 },
  s3*s2*s1:{ P:4, Q:4, R:2 },
  s3*s1:{ P:4, Q:1, R:4 },
  s3*s2:{ P:1, Q:6, R:3 },
  s2:{ P:1, Q:6, R:1 },
  s1*s2*s3*s1*s2*s1:{ P:2, Q:2, R:2 },
  s1*s2*s3:{ P:2, Q:5, R:4 },
  s1*s2*s3*s1*s2:{ P:2, Q:2, R:3 }
}


# Get the big formula for everything
def get_polynomial(alt, conds):
    formula = 0
    for sigma in conds.keys():
        term = p[conds[sigma][P]-1] * q[conds[sigma][Q]-1] * r[conds[sigma][R]-1]
        if(sigma in alt):
            formula += term
        else:
            formula -= term
    return formula

def get_formula(alt):
    f = propcalc.formula('x')
    for sigma in conds.keys():
        sigma_conds = ''
        if(sigma not in alt):
            sigma_conds += '~'
        sigma_conds += '(p%d&q%d&r%d)' % (conds[sigma][P], conds[sigma][Q], conds[sigma][R])
        sigma_statement = propcalc.formula(sigma_conds)
        f = f.add_statement(sigma_statement,'&')
    return f

def find_conditions(alt, conds):
    P_ = 4 * [False]
    Q_ = 6 * [False]
    R_ = 4 * [False]
    substitutions = []

    true_terms = set()

    # First find what must be true
    for sigma in alt:
        P_[conds[sigma][P]-1] = True
        Q_[conds[sigma][Q]-1] = True
        R_[conds[sigma][R]-1] = True
        true_terms.add(p[conds[sigma][P]-1])
        true_terms.add(q[conds[sigma][Q]-1])
        true_terms.add(r[conds[sigma][R]-1])

    for j in range(0,len(P_)):
        if(P_[j]):
            substitutions.append(p[j]==1)
    for j in range(0,len(Q_)):
            if(Q_[j]):
                substitutions.append(q[j]==1)
    for j in range(0,len(R_)):
            if(R_[j]):
                substitutions.append(r[j]==1)


    poly = get_polynomial(alt, conds).substitute(substitutions)
    the_false_ones = [var for var in pqr if should_be_false(poly, var)]
    the_false_ones_zero = [var==0 for var in the_false_ones]

    return sum(true_terms) + poly.substitute(the_false_ones_zero) - sum(the_false_ones) - poly.substitute(everything_zero)

def find_negative_conditions(alt):
    P_ = 4 * [False]
    Q_ = 6 * [False]
    R_ = 4 * [False]
    substitutions = []

    # First find what must be true
    for sigma in alt:
        P_[conds[sigma][P]-1] = True
        Q_[conds[sigma][Q]-1] = True
        R_[conds[sigma][R]-1] = True

    for j in range(0,len(P_)):
        if(P_[j]):
            substitutions.append(p[j]==1)
    for j in range(0,len(Q_)):
            if(Q_[j]):
                substitutions.append(q[j]==1)
    for j in range(0,len(R_)):
            if(R_[j]):
                substitutions.append(r[j]==1)


    poly = get_polynomial(alt).substitute(substitutions)
    the_false_ones = [var for var in pqr if should_be_false(poly, var)]
    the_false_ones_zero = [var==0 for var in the_false_ones]

    return poly.substitute(the_false_ones_zero) - sum(the_false_ones) - poly.substitute(everything_zero)

#def find_conditions(alt):
#    P_ = 4 * [False]
#    Q_ = 6 * [False]
#    R_ = 4 * [False]
#    result = []
#
#    # First find what must be true
#    for sigma in alt:
#        P_[conds[sigma][P]-1] = True
#        Q_[conds[sigma][Q]-1] = True
#        R_[conds[sigma][R]-1] = True
#
#    # Check if the set given is big enough
#    for sigma in conds.keys():
#        if(sigma in alt):
#            continue
#        if(P_[conds[sigma][P]-1]
#        and Q_[conds[sigma][Q]-1]
#        and R_[conds[sigma][R]-1]):
#            return result # No conditions will yield the given subset
#
#
#    return set([P])
