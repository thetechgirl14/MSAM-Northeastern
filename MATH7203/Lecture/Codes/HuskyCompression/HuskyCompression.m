function [im_out, Sin, Sout] = HuskyCompression(im, k)
  % This function accepts an image and a number of singular values
  % to keep.  It does an svd decomposition of the image, then discards
  % all but the first m singular values (and associated vectors).
  % It retains the original size of the matrices, but since they are
  % all zero, one could re-write this to resize the new matrices.

  % The inputs are:
  % im -- image to process, as an NxMx3 RGB array.  Display it using image().
  % k -- number of singular values to keep
  %
  % Returns:
  % im_out -- resulting image, as an NxMx3 RGB array.  Display it using image().
  % Sin -- vector of all singular values computed by svd.
  % Sout -- vector of first k singular values computed by svd.

  % Preallocate 
  Sin = zeros(min(size(im(:,:,1))), 1);
  Sout = zeros(k, 1);

  im_out = zeros(size(im));
  for p = 1:3
    im_double = double(im(:,:,p));
    [U, S, VT] = svd(im_double);
    im1(:,:,p) = U(:,1:k)*S(1:k,1:k)*VT(:,1:k)';
    Sin = Sin + diag(S);
    Sout = Sout + diag(S(1:k,1:k));
  end
  % Normalize for display
  im_out = abs(im1)/max(max(max(im1)));
end

