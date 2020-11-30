︠e31cd4d0-8eee-4d2f-8e2d-6c68afc7ed6fs︠
def generiranje_matrik(m,n): #m število vrstic, n število stolpcev
    matrika = [[0 for i in range(m*n)] for j in range(m*n)]  #i vrstica, j stolpec
    for i in range(0,m*n):
        for j in range(0,m*n):
            if i == j+1 or i == j-1 or i == j-n or j == i-n:
                matrika[i][j] = 1 #enice pod in nad diagonalo ali na diagonalah pod bloki
    for i in range(0,m*n, n):
        matrika[i][i-1] = 0 #popravek, da enice niso na celi pod oz. nad-diagonali
        matrika[i-1][i] = 0 #imamo toliko blokov, kot je minimum m-ja ter n-ja
    for vrstica in matrika: #to je zgolj za lepši izpis
        for element in vrstica:
            print(element, end = " ")
        print()
    print("")
    return matrika

~~
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


def verjetnost_P(i,j,r,matrika):
04b-aced-76100954ae7c    p = 0
    mat = []
    for vrstica in range(0,len(matrika)):
        for stolpec in range(0,len(matrika)):
            if vrstica != j:
                mat[vrstica][stolpec] = matrika[vrstica][stolpec]
    for k in range(0,len(matrika)):
        if k != j:
            p += (mat^(r-1))[i][k]*mat[k][j]
    return p
A = prehodna_matrika_M(generiranje_matrik(1,3))
verjetnost_P(1,2,4,A)
#izris_grafa(generiranje_matrik(2,5))
︡22b13dfb-aa4d-4373-9a80-4948bd465595︡{"stderr":"\n\n*** WARNING: Code contains possible implicit multiplication    ***\n*** Check if any of [ 04b, 76100954ae ] need a \"*\" sign for multiplication, e.g. 5x should be 5*x ! ***\n\nError in lines 16-16\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1231, in execute\n    compile(block + '\\n',\n  File \"<string>\", line 1\n    ~~\n     ^\nSyntaxError: invalid syntax\n"}︡{"done":true}










