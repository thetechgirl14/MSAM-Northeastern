h = 2;
b = 1;

theta = atand(h/b);
A = makeA(theta);
r = maker(20);
f = A\(-r)