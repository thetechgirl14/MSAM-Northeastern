
### A simple set of matrix classes

from array import array

def format_numbers(x, sparse = False):
    if sparse:
        zero = ".".center(10)
        return ["{:10.4f}".format(xi) if xi != 0 else zero for xi in x]
    else:
        return ["{:10.4f}".format(xi) for xi in x]

class Matrix:

    def __init__(self, shape, dtype = "d", axis = 0):
        """
        Creates a matrix
        param shape: A tuple giving the (nrow, ncol)
        param dtype: The data type (defaults to double)
        param axis: The major axis (0 is row-major, 1 is column-major)
        """
        self.nrow, self.ncol = shape
        length = self.nrow * self.ncol
        zeroes = (0 for i in range(length))
        self.data = array(dtype, zeroes)
        self.axis = axis

    def __len__(self):
        return self.nrow * self.ncol

    def __str__(self):
        s = []
        for i in range(self.nrow):
            row = [self[i,j] for j in range(self.ncol)]
            s.append("".join(format_numbers(row, sparse=False)))
        return "\n".join(s)

    def __getitem__(self, index):
        i, j = index
        if self.axis == 0:
            return self.data[i * self.ncol + j]
        else:
            return self.data[j * self.nrow + i]

    def __setitem__(self, index, value):
        i, j = index
        if self.axis == 0:
            self.data[i * self.ncol + j] = value
        else:
            self.data[j * self.nrow + i] = value

    def transpose(self):
        self.nrow, self.ncol = self.ncol, self.nrow
        self.axis = 0 if self.axis != 0 else 1

class SparseMatrix:

    def __init__(self, data, ind, ptr, shape, dtype = "d", axis = 0):
        """
        Creates a sparse matrix
        param data: An iterable of the nonzero data elements
        param ind: An iterable of the nonzero data indices
        param ptr: An iterable of the nonzero data index pointers
        param shape: A tuple giving the (nrow, ncol)
        param dtype: The data type (defaults to double)
        param axis: The compressed axis (0 is CSR, 1 is CSC)
        """
        self.nrow, self.ncol = shape
        self.data = array(dtype, data)
        self.ind = array("L", ind)
        self.ptr = array("L", ptr)
        self.axis = axis

    def __len__(self):
        return self.nrow * self.ncol

    def __str__(self):
        s = []
        for i in range(self.nrow):
            row = [self[i,j] for j in range(self.ncol)]
            s.append("".join(format_numbers(row, sparse=True)))
        return "\n".join(s)

    def __getitem__(self, index):
        i, j = index
        if self.axis == 0:
            i1 = self.ptr[i]
            i2 = self.ptr[i + 1]
            col_ind = self.ind[i1:i2]
            row_data = self.data[i1:i2]
            if j in col_ind:
                return row_data[col_ind.index(j)]
            else:
                return 0
        else:
            i1 = self.ptr[j]
            i2 = self.ptr[j + 1]
            row_ind = self.ind[i1:i2]
            col_data = self.data[i1:i2]
            if i in row_ind:
                return col_data[row_ind.index(i)]
            else:
                return 0

    def transpose(self):
        self.nrow, self.ncol = self.ncol, self.nrow
        self.axis = 0 if self.axis != 0 else 1

### Test matrix methods

if __name__ == "__main__":
    print("\n" + "####" * 10 + "\n")
    x = Matrix((3, 3))
    x[0,0] = 1
    x[1,1] = 1
    x[2,2] = 1
    x[0,2] = 1000
    x[2,0] = -99
    print(x)
    print("\n" + "####" * 10 + "\n")
    x.transpose()
    print(x)
    print("\n" + "####" * 10 + "\n")
    v1 = [11, 22, 33, 44, 55]
    i1 = [1, 3, 0, 3, 1]
    p1 = [0, 2, 4, 5]
    y = SparseMatrix(v1, i1, p1, (3, 4))
    print(y)
    print("\n" + "####" * 10 + "\n")
    y.transpose()
    print(y)
    print("\n" + "####" * 10 + "\n")
    v2 = [33, 11, 55, 22, 44]
    i2 = [1, 0, 2, 0, 1]
    p2 = [0, 1, 3, 3, 5]
    z = SparseMatrix(v2, i2, p2, (3, 4), axis=1)
    print(z)
    print("\n" + "####" * 10 + "\n")
