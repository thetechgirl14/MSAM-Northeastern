function fext = maker(w)
  % This computes the externally applied
  % stresses to the truss structure
  fext = zeros(16,1);
  fext(16) = - w;     % Hanging weight.  Gravity is down (neg).
end