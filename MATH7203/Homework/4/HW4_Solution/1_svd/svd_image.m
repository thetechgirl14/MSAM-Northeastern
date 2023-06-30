function [Sin] = svd_image(im)
  
  %Calculating SVD
  [~, S, ~] = svd(im); 
  Sin = diag(S);
 
  % Counting the non-zero singular values
  disp("Non-zero singular values in matrix are");
  disp(nnz(S > 1e-12));

  % Rank of given matrix
  disp("Rank of matrix is");
  disp(rank(im));

  subplot(2,1,1)
  plot(Sin)

  hold on
  
  subplot(2,1,2)
  semilogy(Sin)

end
