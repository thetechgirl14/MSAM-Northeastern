function x = pivot_gauss(A,b)
    
    [m,n] = size(A);
    if m ~= n
        error('Matrix A must be square'); 
    end
    Aug_m=[A b];
    
    % forward elimination
    for k = 1:n-1
        % partial pivoting
        [~,i] = max(abs(Aug_m(k:n,k)));
        ipr = i+k-1;
        if ipr ~= k
            Aug_m([k,ipr],:)=Aug_m([ipr,k],:);
        end
        for i = k+1:n
            factor = Aug_m(i,k)/Aug_m(k,k);
            Aug_m(i,k:n+1) = Aug_m(i,k:n+1) - factor*Aug_m(k,k:n+1);
        end
    end
    % back substitution
    x = zeros(n,1);
    x(n) = Aug_m(n,n+1)/Aug_m(n,n);
    for i = n-1:-1:1
        x(i) = (Aug_m(i,n+1)-Aug_m(i,i+1:n)*x(i+1:n))/Aug_m(i,i);
    end
end
