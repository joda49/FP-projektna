#!/usr/bin/env python
# coding: utf-8

# In[ ]:


get_ipython().run_line_magic('run', 'generiranje_matrik.ipynb')
get_ipython().run_line_magic('run', 'definicije.ipynb')
get_ipython().run_line_magic('run', 'preizkusi.ipynb')
get_ipython().run_line_magic('run', 'popravljeno.ipynb')


# In[ ]:


import json

def write_json(i, s):
    with open("sez%d.json" % i, "w") as f:
        json.dump(s, f)

#naredimo matrike
A1 = mat_2Dmreza(1, 100)
A2 = mat_2Dmreza(2, 50)
A3 = mat_2Dmreza(10, 10)
B = mat_3Dmreza(5, 5, 4)
C = mat_binarno_drevo(6)
D = mat_ciklicni_graf(100)

#zračunamo centralno vozlišče za vsako matriko
centerA1 = centralnost(A1)
centerA2 = centralnost(A2)
centerA3 = centralnost(A3)
centerB = centralnost(B)
centerC = centralnost(C)
centerD = centralnost(D)
write_json(1, [centerA1, centerA2, centerA3, centerB, centerC, centerD])

#v centralnem vozlišču po definiciji izračunamo naključni sprehod bližine centralnosti
R1A1 = nakjucni_sprehod_blizine_centralnosti(centerA1[0],A1)
R1A2 = nakjucni_sprehod_blizine_centralnosti(centerA2[0],A2)
R1A3 = nakjucni_sprehod_blizine_centralnosti(centerA3[0],A3)
R1B = nakjucni_sprehod_blizine_centralnosti(centerB[0],B)
R1C = nakjucni_sprehod_blizine_centralnosti(centerC[0],C)
R1D = nakjucni_sprehod_blizine_centralnosti(centerD[0],D)
write_json(2, [R1A1, R1A2, R1A3, R1B, R1, R1D])

#v centralnem vozlišču
R2A1_100 = nsbc_koncna(A1, centerA1[0], 100)
R2A2_100 = nsbc_koncna(A2, centerA2[0], 100)
R2A3_100 = nsbc_koncna(A3, centerA3[0], 100)
R2B_100 = nsbc_koncna(B, centerB[0], 100)
R2C_100 = nsbc_koncna(C, centerC[0], 100)
R2D_100 = nsbc_koncna(D, centerD[0], 100)
write_json(3, [R2A1_100, R2A2_100, R2A3_100, R2B_100, R2C_100, R2D_100])

R2A1_1000 = nsbc_koncna(A1, centerA1[0], 1000)
R2A2_1000 = nsbc_koncna(A2, centerA2[0], 1000)
R2A3_1000 = nsbc_koncna(A3, centerA3[0], 1000)
R2B_1000 = nsbc_koncna(B, centerB[0], 1000)
R2C_1000 = nsbc_koncna(C, centerC[0], 1000)
R2D_1000 = nsbc_koncna(D, centerD[0], 1000)
write_json(4, [R2A1_1000, R2A2_1000, R2A3_1000, R2B_1000, R2C_1000, R2D_1000])

R2A1_10000 = nsbc_koncna(A1, centerA1[0], 10000)
R2A2_10000 = nsbc_koncna(A2, centerA2[0], 10000)
R2A3_10000 = nsbc_koncna(A3, centerA3[0], 10000)
R2B_10000 = nsbc_koncna(B, centerB[0], 10000)
R2C_10000 = nsbc_koncna(C, centerC[0], 10000)
R2D_10000 = nsbc_koncna(D, centerD[0], 10000)
write_json(5, [R2A1_10000, R2A2_10000, R2A3_10000, R2B_10000, R2C_10000, R2D_10000])

R2A1_100000 = nsbc_koncna(A1, centerA1[0], 100000)
R2A2_100000 = nsbc_koncna(A2, centerA2[0], 100000)
R2A3_100000 = nsbc_koncna(A3, centerA3[0], 100000)
R2B_100000 = nsbc_koncna(B, centerB[0], 100000)
R2C_100000 = nsbc_koncna(C, centerC[0], 100000)
R2D_100000 = nsbc_koncna(D, centerD[0], 100000)
write_json(6, [R2A1_100000, R2A2_100000, R2A3_100000, R2B_100000, R2C_100000, R2D_100000])

#po stari metodi
S_A1 = nsbc_max(A1,1000)
S_A2 = nsbc_max(A2,1000)
S_A3 = nsbc_max(A2,1000)
S_B = nsbc_max(B,1000)
S_C = nsbc_max(C,1000)
S_D = nsbc_max(D,1000)
write_json(7, [S_A1, S_A2, S_A3, S_B, S_C, S_D])

S_2A1 = nsbc_max(A1,10000)
S_2A2 = nsbc_max(A2,10000)
S_2A3 = nsbc_max(A2,10000)
S_2B = nsbc_max(B,10000)
S_2C = nsbc_max(C,10000)
S_2D = nsbc_max(D,10000)
write_json(8, [S_2A1, S_2A2, S_2A3, S_2B, S_2C, S_2D])
