function A = makeA(theta)
  % Accepts angle theta in degrees, returns force matrix A
  c = cosd(theta);
  s = sind(theta);
  % This particular matrix derived from method of joints
  % applied to truss in problem.
  A = zeros(16, 16);
  
  % Joint a
  A(1,1) = -1;
  A(1,13) = 1;
  
  A(2,14) = 1;
  
  % Joint b
  A(3,2) = -c;
  A(3,3) = -1;
  A(3,15) = 1;
  
  A(4,2) = -s;
  A(4,16) = 1;
  
  % Joint c
  A(5,1) = 1;
  A(5,2) = c;
  A(5,4) = -1;
  A(5,5) = -c;
 
  A(6,2) = s;
  A(6,5) = s;
  
  % Joint d
  A(7,4) = 1;
  A(7,7) = -1;
  
  A(8,6) = 1;
  
  % Joint e
  A(9,3) = 1;
  A(9,5) = c;
  A(9,8) = -c;
  A(9,9) = -1;

  A(10,5) = -s;
  A(10,6) = -1;
  A(10,8) = -s;

  % Joint f
  A(11,7) = 1;
  A(11,8) = c;
  A(11,10) = -1;
  A(11,11) = -c;

  A(12,8) = s;
  A(12,11) = s;
  
  % Joint g
  A(13,10) = 1;
  
  A(14,12) = 1;
 
  % Joint h
  A(15,9) = 1;
  A(15,11) = c;

  A(16,11) = -s;
  A(16,12) = -1;
end