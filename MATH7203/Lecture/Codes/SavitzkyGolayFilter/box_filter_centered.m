function [tf, yf] = box_filter_centered(t, x, Npts)
  % Performs centered box average over Npts points.
 
  % Check that Npts is an odd number
  if (mod(Npts, 2) == 0)
    error('Npts must be an odd number!')
  end
    
  % Compute number of points to the left & right
  Noffset = (Npts-1)/2;

  Nx = length(x)
  yf = zeros(Nx-Npts+1, 1);
  tf = zeros(Nx-Npts+1, 1);  

  % Loop over input pts, compute box average
  for n = (1+Noffset):(Nx-Noffset)
    idx = (n-Noffset):(n+Noffset);
    tf(n-Noffset) = t(n);
    yf(n-Noffset) = sum(x(idx))/Npts;
  end
  
end

