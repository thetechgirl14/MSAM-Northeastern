function coeffs = savitzkyGolay(p, n)
    % Computes the Savitzky-Golay filter coefficients for a polynomial of degree p and a window of size n
    % Assumes equally-spaced points
    
    % Compute the coefficient matrix A
    A = zeros(n, p+1);
    for i = 1:n
        for j = 1:p+1
            A(i,j) = (i - (n+1)/2)^(j-1);
        end
    end
    
    % Compute the inverse of the normal equations matrix
    
    AT = A';
    ATA = AT*A;
    invATA = inv(ATA);
    
    % Compute the filter coefficients
    coeff = invATA*AT;
    coeffs = coeff(1,:); 
end


