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

def find_conditions(alt, conds):
    (true_, false_) = get_general_formula(alt, conds)

    # First pass: Remove redundancies with nonnegative assumptinos
    for var in true_:
        for s in false_:
            if var in s:
                s.remove(var)

    # Get max length of false set
    max_length = max([len(s) for s in false_])

    '''
    Remove duplicates until 'removing duplicates' does nothing,
    i.e. until there are no more duplicates
    '''
    prev_false = []
    while(false_ != prev_false):
        prev_false = false_[:]
        for size in range(1,max_length+1):
            for f in false_:
                if len(f) == size:
                    for suspect in false_:
                        if(f != suspect and f.issubset(suspect)):
                            false_.remove(suspect)
                            #false_[j] = false_[j].difference(f)

    return (true_,false_)

def get_general_formula(alt, conds):
    true_ = set()
    false_ = []
    for sigma in conds.keys():
        term = {p[conds[sigma][P]-1] , q[conds[sigma][Q]-1] , r[conds[sigma][R]-1]}
        if(sigma in alt):
            for t in term:
                true_.add(t)
        else:
            false_.append(term)
    return (true_,false_)


def remove_duplicates(L):
    result = []
    for l in L:
        if l not in result:
            result.append(l)
    return result

# Get the big formula for everything

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
