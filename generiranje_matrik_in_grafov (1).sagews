︠e31cd4d0-8eee-4d2f-8e2d-6c68afc7ed6fs︠
def generiranje_matrik(m,n): #mreža; m število vrstic, n število stolpcev,n=<m
    matrika = [[0 for i in range(m*n)] for j in range(m*n)]  #i vrstica, j stolpec
    for i in range(0,m*n):
        for j in range(0,m*n):
            if i == j+1 or i == j-1 or i == j-n or j == i-n:
                matrika[i][j] = 1
    for i in range(0,m*n, n):
        matrika[i][i-1] = 0
        matrika[i-1][i] = 0
    for vrstica in matrika:
        for element in vrstica:
            print(element, end = " ")
        print()
    print("")
    return matrika


def izris_grafa(matrika):
    matrika = Matrix(matrika)
    G = Graph(matrika)
    return G.plot().show()



def prehodna_matrika_M(matrika):
    for vrstica in range(0,len(matrika)):
        vsota = 0
        for stolpec in range(0,len(matrika)):
            vsota += matrika[vrstica][stolpec]
        for stolpec in range(0,len(matrika)):
            matrika[vrstica][stolpec] = matrika[vrstica][stolpec]/vsota
    return matrika

import numpy as np
def brisanje(j,matrika): #brisanje j-te vrstice in j-tega stolpca
    matrika.pop(j)
    matrika = np.transpose(matrika)
    matrika = matrika.tolist()
    matrika.pop(j)
    matrika = np.transpose(matrika)
    matrika = matrika.tolist()
    return matrika

def verjetnost(i,j,r,matrika):   #verjetnost, da prvič potrebujemo natančno r korakov, da dosežemo j iz i
    p = 0
    dolzina = len(matrika)
    mat = brisanje(j,matrika)
    mat = Matrix(mat)
    matrika = Matrix(matrika)
    for k in range(0,dolzina-1):
        if k != j:
            p += ((mat^(r))[i][k]) * (matrika[k][j])
    return p


from mpmath import nsum, inf
def matrika_H(i,j,matrika):  #srednji čas prvega prehoda od vozlišča i do vozlišča j
    rez = nsum(lambda r: r*(verjetnost(i,j,r,matrika)), [1, inf])
    return rez





#preizkusi funkcij
A = (generiranje_matrik(3,5))
matrika_H(1,3,A)
# izris_grafa(A)
# A = prehodna_matrika_M(A)
# show(prehodna_matrika_M(A))
# A = Matrix(A)
# show(A)
# show((A^2)[1][1])
# B = A^2
# show(B)
#generiranje_matrik(1,3)

#brisanje(2,A)
#verjetnost(0,6,4,A)
#izris_grafa(generiranje_matrik(2,5))
︡717d8c9c-3066-4472-9561-ec965adca156︡{"stdout":"0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 \n1 0 1 0 0 0 1 0 0 0 0 0 0 0 0 \n0 1 0 1 0 0 0 1 0 0 0 0 0 0 0 \n0 0 1 0 1 0 0 0 1 0 0 0 0 0 0 \n0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 \n1 0 0 0 0 0 1 0 0 0 1 0 0 0 0 \n0 1 0 0 0 1 0 1 0 0 0 1 0 0 0 \n0 0 1 0 0 0 1 0 1 0 0 0 1 0 0 \n0 0 0 1 0 0 0 1 0 1 0 0 0 1 0 \n0 0 0 0 1 0 0 0 1 0 0 0 0 0 1 \n0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 \n0 0 0 0 0 0 1 0 0 0 1 0 1 0 0 \n0 0 0 0 0 0 0 1 0 0 0 1 0 1 0 \n0 0 0 0 0 0 0 0 1 0 0 0 1 0 1 \n0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 \n\n"}︡{"stderr":"Error in lines 52-52\nTraceback (most recent call last):\n  File \"sage/matrix/matrix_integer_dense.pyx\", line 963, in sage.matrix.matrix_integer_dense.Matrix_integer_dense.__pow__ (build/cythonized/sage/matrix/matrix_integer_dense.c:10842)\n    n = Integer(n)\n  File \"sage/rings/integer.pyx\", line 747, in sage.rings.integer.Integer.__init__ (build/cythonized/sage/rings/integer.c:7081)\n    raise TypeError(\"unable to coerce %s to an integer\" % type(x))\nTypeError: unable to coerce <class 'sage.libs.mpmath.ext_main.mpf'> to an integer\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1230, in execute\n    exec(\n  File \"\", line 1, in <module>\n  File \"\", line 2, in matrika_H\n  File \"/ext/sage/sage-9.2/local/lib/python3.8/site-packages/mpmath/calculus/extrapolation.py\", line 1718, in nsum\n    return +ctx.adaptive_extrapolation(update, emfun, options)\n  File \"/ext/sage/sage-9.2/local/lib/python3.8/site-packages/mpmath/calculus/extrapolation.py\", line 1165, in adaptive_extrapolation\n    update(partial, xrange(index, index+step))\n  File \"/ext/sage/sage-9.2/local/lib/python3.8/site-packages/mpmath/calculus/extrapolation.py\", line 1706, in update\n    psum = psum + g(ctx.mpf(k))\n  File \"/ext/sage/sage-9.2/local/lib/python3.8/site-packages/mpmath/calculus/extrapolation.py\", line 1753, in g\n    return f(*args)\n  File \"/ext/sage/sage-9.2/local/lib/python3.8/site-packages/mpmath/calculus/extrapolation.py\", line 1808, in g\n    return f(*args)\n  File \"\", line 2, in <lambda>\n  File \"\", line 9, in verjetnost\n  File \"sage/matrix/matrix_integer_dense.pyx\", line 970, in sage.matrix.matrix_integer_dense.Matrix_integer_dense.__pow__ (build/cythonized/sage/matrix/matrix_integer_dense.c:11016)\n    raise NotImplementedError(\"the given exponent is not supported\")\nNotImplementedError: the given exponent is not supported\n"}︡{"done":true}
︠5ffae197-d06c-41fd-b028-d9e3ed263177s︠

︡ecab821e-9729-41b4-ae97-ff1fc1e19b0b︡{"done":true}


















