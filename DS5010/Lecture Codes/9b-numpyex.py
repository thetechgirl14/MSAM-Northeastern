
import numpy as np

# create a simple 2 x 2 matrix

A = np.array([[1, 2], [3, 4]], dtype=np.int32)
A

A.shape = (4, 1) # change shape
A

A.shape = (1, 4) # change shape
A

A.shape = (2, 2) # restore original shape
A

A.reshape(4, 1) # new matrix with new shape
A.reshape(1, 4) # new matrix with new shape

A

# indexing and slicing a matrix

B = np.array(np.arange(16), dtype=np.float64)
B.shape = (4, 4)
B

B[0,0]
B[1,1]
B[3,3]

B[0,:] # first row
B[1,:] # second row
B[-1,:] # last row

B[:,0] # first col
B[:,1] # second col
B[:,-1] # last col

B[0:2,0:2] # upper-left 2 x 2 submatrix
B[2:4,2:4] # lower-right 2 x 2 submatrix
B[:-1,:-1] # upper-left submatrix minus last row/col

# boolean indexing

B % 2 == 0
B_ = B.copy()
B_[B % 2 == 0] = -99
B_

# elementwise arithmetric on matrices

100 + B # scalar addition

100 * B  # scalar multiplication

B / 100   # scalar division

np.exp(B) # apply unary function

np.log(B + 1) # apply unary function

B + B # elementwise matrix addition

B * B # elementwise matrix multiplication

B ** B # elementwise matrix exponentiation

# matrix operations

C = np.ones((2,4))
C

C.dot(B) # matrix multiplication

B.dot(B) # matrix multiplication

# higher dimensions

B.reshape(4, 2, 2) # 3D array: 4 x 2 x 2

B.reshape(2, 2, 2, 2) # 4D array: 2 x 2 x 2 x 2

# summaries and broadcasting

B.mean() # mean of all elements in B
B.mean(0) # mean of cols (calculate OVER rows: axis = 0)
B.mean(1) # mean of rows (calculate OVER cols: axis = 1)

B - B.mean(0) # subtract mean of columns (standardize cols)

B - B.mean(1).reshape((4,1)) # subtract mean of rows (standardize cols)

# linear algebra

np.random.seed(1)

D = np.random.rand(25)
D.shape = (5, 5)

Du, Dd, Dv = np.linalg.svd(D)
Dd # singular values
Dv # right singular vectors


