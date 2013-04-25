Math480hw3
==========

Homework3

# 1
For my python factorial algorithm, I added "%cython" and identified x as an "int" 
and significantly improved the run time of the algorithm.

# 2
Just like #1, I add "%cython" and "int", but this time, I also added "cdef int i" 
since "i" is initialized inside of the function instead of before or in the input.

# 3
For this problem, I only added "%cython" and "int n" in the input to make it faster.
I could have added a cdef line, but I was content with the improved result I got. 

# 4
Instead of creating an algorithm for the determinant of a 4x4 matrix, I just calculated
the determinant as anyone would by hand. In the cython section, I only added a "%cython"
since I was not sure of what type of input a matrix x would be called.

# 5
This problem was easier to create an algorithm that would essentially take any size 
matrices and compute the product of them. In the cython section, I added "%cython" and 
also "cdef int rows_A, cols_A, rows_B, cols_B" to make the loop run faster. 

Overall, all the cython functions run must faster than normal python functions. 
