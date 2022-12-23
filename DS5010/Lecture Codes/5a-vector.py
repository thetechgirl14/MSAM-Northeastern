
### OOP Example - Vector

import math

class Vector:
    
    def __init__(self, data):
        self.data = data

    def __str__(self):
        s = ",".join([str(x) for x in self.data])
        return "Vector<" + s + ">"

    def __repr__(self):
        return str(self)

    def __len__(self):
        return len(self.data)

    def __iter__(self):
        return iter(self.data)

    def __getitem__(self, i):
        return self.data[i]

    def inner(self, y):
        assert len(self) == len(y)
        prod = 0
        for xi, yi, in zip(self, y):
            prod += xi * yi
        return prod

    def dist(self, y):
        assert len(self) == len(y)
        d2 = 0
        for xi, yi, in zip(self, y):
            d2 += (xi - yi) ** 2
        return math.sqrt(d2)

    def l1norm(self):
        return sum([abs(x) for x in self.data])

    def l2norm(self):
        return math.sqrt(sum([x ** 2 for x in self.data]))

if __name__ == "__main__":
    print("----Testing Vector----")
    x = Vector([1,2,3])
    print(x)
    print("len(x) = {}".format(len(x)))
    print("x.l1norm() = {}".format(x.l1norm()))
    print("x.l2norm() = {}".format(x.l2norm()))
    print("iter: " + str([xi for xi in x]))
    y = Vector([4,5,6])
    print(y)
    print("x.dist(y) = {}".format(x.dist(y)))
    print("x.inner(y) = {}".format(x.inner(y)))


