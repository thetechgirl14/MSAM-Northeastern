A = [ 2 4 3 5 6 37; 4 8 7 5 2 74; -2 -4 3 4 -5 20; 1 2 2 -1 2 26; 5 -10 4 6 4 24];
S = sym(A);
rref(S)
syms v w x y z
eqn1 = 2*v + 4*w + 3*x + 5*y + 6*z == 37;
eqn2 = 4*v + 8*w + 7*x + 5*y + 2*z == 74;
eqn3 = -2*v - 4*w + 3*x + 4*y - 5*z == 20;
eqn4 = v + 2*w + 2*x - y + 2*z == 26;
eqn5 = 5*v - 10*w + 4*x + 6*y + 4*z == 24;

[A,B] = equationsToMatrix([eqn1, eqn2, eqn3, eqn4, eqn5],[v, w, x, y, z])

X = linsolve(A,B)


syms x y z
e1 = -x + y -3*z == 0;
e2 = x - y +3*z == 0;1
e3 = 3*x - 2*y + 13*z ==0;
[A,B] = equationsToMatrix([e1,e2,e3],[x,y,z])
X = linsolve(A,B)