A = [ 1 2 3 4; 1 1 0 2; 2 0 1 2];
S = sym(A);
rref(S);
rref(A);
Ar2 = rrefgf(A,2)
Ar3 = rrefgf(A,3)
Ar5 = rrefgf(A,5)
Ar7 = rrefgf(A,7)


