clear
syms p q r a b  positive
%p=0.1; 
%q=1;
%r=2;
syms a b s11 s12 s22 % variables and covariances
G = [1 -1 0; 0 1 -1]
R = [p; q*a; r*b]
f = G*R
steady = solve(f,[a, b]);
as  =steady.a
bs = steady.b
%MEAN_A = subs(A,[p,q,r],[10,1,2])
%MEAN_B = subs(B,[p,q,r],[10,1,2])
J = jacobian(f,[a b])
B = G*diag(R)*G' 
B = subs(B,[a,b],[as,bs])
S = [s11,s12;s12,s22]
M = solve(S*J'+J*S+B,[s11,s12,s22])
varX = M.s11
varY = M.s22
covXY = M.s12
