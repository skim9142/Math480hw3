'''
Sean Kim
Math 480
Homework 3
'''
︠16e9eed1-69b7-416d-8e93-7f7cc449f3fcr︠
# 1

# python
def myfactorial(x):
    n = 1
    if x%1 == 0:
        while (x > 0):
            n = n * x
            x = x - 1
        return n
        print n
    else:
        print "Input must be an integer"

# cython
%cython
def cfactorial(int x):
    cdef int n = 1
    if x%1 == 0:
        while (x > 0):
            n = n * x
            x = x - 1
        return n
        print n
︡f05136a6-9d34-4de5-9807-98621d98b656︡{}︡{"file":{"show":false,"uuid":"21984ec3-396d-40a8-bb30-3bfc5f4e037e","filename":"/home/9ba840c1/.sage/temp/u/11888/spyx/_home_9ba840c1__sage_temp_u_11888_dir_hGK2y7_a_pyx/_home_9ba840c1__sage_temp_u_11888_dir_hGK2y7_a_pyx_0.html"}}︡{"html":"<a href='/blobs//home/9ba840c1/.sage/temp/u/11888/spyx/_home_9ba840c1__sage_temp_u_11888_dir_hGK2y7_a_pyx/_home_9ba840c1__sage_temp_u_11888_dir_hGK2y7_a_pyx_0.html?uuid=21984ec3-396d-40a8-bb30-3bfc5f4e037e' target='_new' class='btn btn-small '>Show auto-generated code >> </a>"}︡{"stdout":"","done":true}︡
︠371ce66d-d156-4173-b423-4a959a6bd8a9r︠
%timeit myfactorial(100)
%timeit cfactorial(100)
︡2c643d1f-d2d1-4252-a5ca-9719b63097fe︡{}︡{"stdout":"625 loops, best of 3: 52.5 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"625 loops, best of 3: 328 ns per loop"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠2e73c995-59e5-4efd-a05b-769565ae5264r︠
# 2

# python
def ss(n):
    return sum([i**2 for i in range(n + 1)])

# cython
%cython
def css(int n):
    cdef int i
    return sum([i**2 for i in range(n + 1)])
︡37a25c0d-f953-422d-ae83-582ab1bdabb4︡{}︡{"file":{"show":false,"uuid":"0c327c02-f87f-4a3b-a187-0ae989b5a8aa","filename":"/home/9ba840c1/.sage/temp/u/11888/spyx/_home_9ba840c1__sage_temp_u_11888_dir_witDWP_a_pyx/_home_9ba840c1__sage_temp_u_11888_dir_witDWP_a_pyx_0.html"}}︡{"html":"<a href='/blobs//home/9ba840c1/.sage/temp/u/11888/spyx/_home_9ba840c1__sage_temp_u_11888_dir_witDWP_a_pyx/_home_9ba840c1__sage_temp_u_11888_dir_witDWP_a_pyx_0.html?uuid=0c327c02-f87f-4a3b-a187-0ae989b5a8aa' target='_new' class='btn btn-small '>Show auto-generated code >> </a>"}︡{"stdout":"","done":true}︡
︠5475a493-d02a-4811-8d39-16b8a9005f73r︠
print ss(200)
%timeit ss(200)
print css(200)
%timeit css(200)
︡8c48fcce-ac41-4523-8c41-41345dfae85e︡{}︡{"stdout":"2686700"}︡{"stdout":"\n"}︡{"stdout":"625 loops, best of 3: 136 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"2686700"}︡{"stdout":"\n"}︡{"stdout":"625 loops, best of 3: 5.46 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠990ce036-f6d2-4762-ae71-332de1dcd548r︠
# 3

# python

def primes(n):
    if n == 2:
        return [2]
    elif n < 2:
        return []
    s = range(3,n+1,2)
    mroot = n**0.5
    half = (n+1)/2-1
    i = 0
    m = 3
    while m <= mroot:
        if s[i]:
            j = (m*m-3)/2
            s[j] = 0
            while j < half:
                s[j] = 0
                j += m
        i += 1
        m = 2 * i + 3
    return [2] + [x for x in s if x]

# cython
%cython
def cprimes(int n):
    if n == 2:
        return [2]
    elif n < 2:
        return []
    s = range(3,n+1,2)
    mroot = n**0.5
    half = (n+1)/2-1
    i = 0
    m = 3
    while m <= mroot:
        if s[i]:
            j = (m*m-3)/2
            s[j] = 0
            while j < half:
                s[j] = 0
                j += m
        i += 1
        m = 2 * i + 3
    return [2] + [x for x in s if x]
︡65a1f20a-397e-4e6f-8e9f-42146fd3e10b︡{}︡{"file":{"show":false,"uuid":"9500511c-eb34-4416-afc9-7b4c20d2bfa8","filename":"/home/9ba840c1/.sage/temp/u/11888/spyx/_home_9ba840c1__sage_temp_u_11888_dir_xCQTfg_a_pyx/_home_9ba840c1__sage_temp_u_11888_dir_xCQTfg_a_pyx_0.html"}}︡{"html":"<a href='/blobs//home/9ba840c1/.sage/temp/u/11888/spyx/_home_9ba840c1__sage_temp_u_11888_dir_xCQTfg_a_pyx/_home_9ba840c1__sage_temp_u_11888_dir_xCQTfg_a_pyx_0.html?uuid=9500511c-eb34-4416-afc9-7b4c20d2bfa8' target='_new' class='btn btn-small '>Show auto-generated code >> </a>"}︡{"stdout":"","done":true}︡
︠f500382d-b091-40ea-96c4-8fb9b1bdd9d7r︠
print primes(17)
%timeit primes(17)
print cprimes(17)
%timeit cprimes(17)
︡12197494-2d2b-4798-a055-2c844f47216c︡{}︡{"stdout":"[2, 3, 5, 7, 11, 13, 17]"}︡{"stdout":"\n"}︡{"stdout":"625 loops, best of 3: 90 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"[2, 3, 5, 7, 11, 13, 17]"}︡{"stdout":"\n"}︡{"stdout":"625 loops, best of 3: 1.57 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠6dfa5583-c566-461b-8a4c-1282dd84ce62r︠
# 4

#python
def mydet(x):
    return x[0][0]*x[1][1]*x[2][2]*x[3][3] \
            - x[0][0]*x[1][1]*x[2][3]*x[3][2] \
            + x[0][0]*x[1][2]*x[2][3]*x[3][1] \
            - x[0][0]*x[1][2]*x[2][1]*x[3][3] \
            + x[0][0]*x[1][3]*x[2][1]*x[3][2] \
            - x[0][0]*x[1][3]*x[2][2]*x[3][1] \
            - x[0][1]*x[1][2]*x[2][3]*x[3][0] \
            + x[0][1]*x[1][2]*x[2][0]*x[3][3] \
            - x[0][1]*x[1][3]*x[2][0]*x[3][2] \
            + x[0][1]*x[1][3]*x[2][2]*x[3][0] \
            - x[0][1]*x[1][0]*x[2][2]*x[3][3] \
            + x[0][1]*x[1][0]*x[2][3]*x[3][2] \
            + x[0][2]*x[1][3]*x[2][0]*x[3][1] \
            - x[0][2]*x[1][3]*x[2][1]*x[3][0] \
            + x[0][2]*x[1][0]*x[2][1]*x[3][3] \
            - x[0][2]*x[1][0]*x[2][3]*x[3][1] \
            + x[0][2]*x[1][1]*x[2][3]*x[3][0] \
            - x[0][2]*x[1][1]*x[2][0]*x[3][3] \
            - x[0][3]*x[1][0]*x[2][1]*x[3][2] \
            + x[0][3]*x[1][0]*x[2][2]*x[3][1] \
            - x[0][3]*x[1][1]*x[2][2]*x[3][0] \
            + x[0][3]*x[1][1]*x[2][0]*x[3][2] \
            - x[0][3]*x[1][2]*x[2][0]*x[3][1] \
            + x[0][3]*x[1][2]*x[2][1]*x[3][0]

# cython
%cython
def cdet(x):
    return x[0][0]*x[1][1]*x[2][2]*x[3][3] \
            - x[0][0]*x[1][1]*x[2][3]*x[3][2] \
            + x[0][0]*x[1][2]*x[2][3]*x[3][1] \
            - x[0][0]*x[1][2]*x[2][1]*x[3][3] \
            + x[0][0]*x[1][3]*x[2][1]*x[3][2] \
            - x[0][0]*x[1][3]*x[2][2]*x[3][1] \
            - x[0][1]*x[1][2]*x[2][3]*x[3][0] \
            + x[0][1]*x[1][2]*x[2][0]*x[3][3] \
            - x[0][1]*x[1][3]*x[2][0]*x[3][2] \
            + x[0][1]*x[1][3]*x[2][2]*x[3][0] \
            - x[0][1]*x[1][0]*x[2][2]*x[3][3] \
            + x[0][1]*x[1][0]*x[2][3]*x[3][2] \
            + x[0][2]*x[1][3]*x[2][0]*x[3][1] \
            - x[0][2]*x[1][3]*x[2][1]*x[3][0] \
            + x[0][2]*x[1][0]*x[2][1]*x[3][3] \
            - x[0][2]*x[1][0]*x[2][3]*x[3][1] \
            + x[0][2]*x[1][1]*x[2][3]*x[3][0] \
            - x[0][2]*x[1][1]*x[2][0]*x[3][3] \
            - x[0][3]*x[1][0]*x[2][1]*x[3][2] \
            + x[0][3]*x[1][0]*x[2][2]*x[3][1] \
            - x[0][3]*x[1][1]*x[2][2]*x[3][0] \
            + x[0][3]*x[1][1]*x[2][0]*x[3][2] \
            - x[0][3]*x[1][2]*x[2][0]*x[3][1] \
            + x[0][3]*x[1][2]*x[2][1]*x[3][0]
︡3310437c-1af1-4ddc-b757-a9cd0501bd66︡{}︡{"file":{"show":false,"uuid":"3a0425ad-4c82-4198-b618-ac1af15fbf7c","filename":"/home/9ba840c1/.sage/temp/u/11888/spyx/_home_9ba840c1__sage_temp_u_11888_dir_3zIQTa_a_pyx/_home_9ba840c1__sage_temp_u_11888_dir_3zIQTa_a_pyx_0.html"}}︡{"html":"<a href='/blobs//home/9ba840c1/.sage/temp/u/11888/spyx/_home_9ba840c1__sage_temp_u_11888_dir_3zIQTa_a_pyx/_home_9ba840c1__sage_temp_u_11888_dir_3zIQTa_a_pyx_0.html?uuid=3a0425ad-4c82-4198-b618-ac1af15fbf7c' target='_new' class='btn btn-small '>Show auto-generated code >> </a>"}︡{"stdout":"","done":true}︡
︠43c885d8-f0aa-41f1-9282-cf5d78ea8fb0r︠
print mydet([[1,0,1,0],[1,2,3,4],[0,2,0,2],[5,6,7,8]])
%timeit mydet([[1,0,1,0],[1,2,3,4],[0,2,0,2],[5,6,7,8]])
print cdet([[1,0,1,0],[1,2,3,4],[0,2,0,2],[5,6,7,8]])
%timeit cdet([[1,0,1,0],[1,2,3,4],[0,2,0,2],[5,6,7,8]])
︡814079f0-009c-410d-9d0e-6a4c339819e8︡{}︡{"stdout":"0"}︡{"stdout":"\n"}︡{"stdout":"625 loops, best of 3: 45.2 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"0"}︡{"stdout":"\n"}︡{"stdout":"625 loops, best of 3: 8.77 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠2f2edae3-3674-461c-8a43-afdfa34fbea3r︠
# 5

# python
def mult(A,B):
    rows_A = len(A)
    cols_A = len(A[0])
    rows_B = len(B)
    cols_B = len(B[0])
    C = [[0 for col in range(len(B[0]))] for row in range(len(A))]
    for i in range(rows_A):
        for j in range(cols_B):
            for k in range(cols_A):
                C[i][j] += A[i][k]*B[k][j]
    return C

# cython
%cython
def cmult(A,B):
    cdef int rows_A, cols_A, rows_B, cols_B
    C = [[0 for col in range(len(B[0]))] for row in range(len(A))]
    rows_A = len(A)
    cols_A = len(A[0])
    rows_B = len(B)
    cols_B = len(B[0])
    for i in range(rows_A):
        for j in range(cols_B):
            for k in range(cols_A):
                C[i][j] += A[i][k]*B[k][j]
    return C
︡37cda35d-cdaf-4dd4-beca-f56a97e5ff23︡{}︡{"file":{"show":false,"uuid":"65b5a60a-57f2-42ed-9933-6a1a90559f43","filename":"/home/9ba840c1/.sage/temp/u/11888/spyx/_home_9ba840c1__sage_temp_u_11888_dir_bIrR2U_a_pyx/_home_9ba840c1__sage_temp_u_11888_dir_bIrR2U_a_pyx_0.html"}}︡{"html":"<a href='/blobs//home/9ba840c1/.sage/temp/u/11888/spyx/_home_9ba840c1__sage_temp_u_11888_dir_bIrR2U_a_pyx/_home_9ba840c1__sage_temp_u_11888_dir_bIrR2U_a_pyx_0.html?uuid=65b5a60a-57f2-42ed-9933-6a1a90559f43' target='_new' class='btn btn-small '>Show auto-generated code >> </a>"}︡{"stdout":"","done":true}︡
︠cef7b527-f716-4344-a6db-71f1730bb965r︠
print mult([[1,0,1,0],[1,2,3,4],[0,2,0,2],[5,6,7,8]],[[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]])
%timeit mult([[1,0,1,0],[1,2,3,4],[0,2,0,2],[5,6,7,8]],[[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]])
print cmult([[1,0,1,0],[1,2,3,4],[0,2,0,2],[5,6,7,8]],[[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]])
%timeit cmult([[1,0,1,0],[1,2,3,4],[0,2,0,2],[5,6,7,8]],[[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]])
︡05852e5b-4186-4804-8963-a5a5942e591e︡{}︡{"stdout":"[[1, 0, 1, 0], [1, 2, 3, 4], [0, 2, 0, 2], [5, 6, 7, 8]]"}︡{"stdout":"\n"}︡{"stdout":"625 loops, best of 3: 45.4 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"[[1, 0, 1, 0], [1, 2, 3, 4], [0, 2, 0, 2], [5, 6, 7, 8]]"}︡{"stdout":"\n"}︡{"stdout":"625 loops, best of 3: 15.6 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠371167b0-0aa5-457b-8cd9-03b50ae49294r︠




















