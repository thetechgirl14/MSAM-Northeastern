disp("Lab 2b. 1.4.1 Task 1")

W = 1 / 3 * [-1; -2; 2];

x0_E = 117.67 * [4; 1; 3];

P = x0_E / norm(x0_E);

Q = cross(W, P);

disp("P = "); disp(P);
disp("Q = "); disp(Q);
disp("W = "); disp(W);


disp("Lab 2b. 1.4.2 Task 2")

Id_EU = [P, Q, W];

disp("Id_EU = (P Q W) ="); disp(Id_EU);

Id_UE = Id_EU\eye(3);

disp("Id_UE = (Id_EU)^(-1) = (Id_EU)^T = "); disp(Id_UE);



disp("Lab 2b. 1.4.3 Task 3")

disp("R3_EE = id_EU * R3_UU * id_UE")

disp("For t = 0.5: theta = omega * t = 3.91*0.5")

R3_UU_0_5 = [[cos(3.91 * 0.5), -sin(3.91 * 0.5), 0];
    [sin(3.91 * 0.5), cos(3.91 * 0.5), 0];
    [0, 0, 1]]

R3_EE_0_5 = Id_EU * R3_UU_0_5 * Id_UE

x_0_5 = R3_EE_0_5 * x0_E;

disp("x(t=0.5) = R3_EE * x(0)")
disp("x(0.5) = ")
disp(x_0_5);

disp("For t = 1: theta = omega * t = 3.91*1")
R3_UU_1 = [[cos(3.91 * 1), -sin(3.91 * 1), 0];
    [sin(3.91 * 1), cos(3.91 * 1), 0];
    [0, 0, 1]]

R3_EE_1 = Id_EU * R3_UU_1 * Id_UE

x_1 = R3_EE_1 * x0_E;

disp("x(t=1.0) = R3_EE * x(0)")
disp("x(1) = ")
disp(x_1);

disp("For t = 1.5: theta = omega * t = 3.91*1.5")

R3_UU_1_5 = [[cos(3.91 * 1.5), -sin(3.91 * 1.5), 0];
    [sin(3.91 * 1.5), cos(3.91 * 1.5), 0];
    [0, 0, 1]]

R3_EE_1_5 = Id_EU * R3_UU_1_5 * Id_UE

x_1_5 = R3_EE_1_5 * x0_E;

disp("x(t=1.5) = R3_EE * x(0)")
disp("x(1.5) = ")
disp(x_1_5);

