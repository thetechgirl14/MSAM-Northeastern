R = [0.67; 0.33];
B = [0.14; 0.08];
G = [0.21; 0.71];

RBG = [R, B, G];

disp("Lab 2a. 1.3.1 Task 1")

S = sym(RBG)
rref(S)


disp("Lab 2a. 1.3.2 Task 2")

M = [R,B]
D1 = [1;0];
D2 = [0;1];

N = rref([M D1 D2]);
O = N(:,[3:4])


disp("Lab 2b. 1.3.4 Task 4")

X = [0.3; 0.5];

P = [RBG; [1, 1, 1]];

rbg = P\([X; 1]);

disp(rbg);


disp("Lab 2b. 1.3.5 Task 5")

X_prime = 2 * ((R + B + G) / 3 - X / 2);

disp(P\([X_prime; 1]));

