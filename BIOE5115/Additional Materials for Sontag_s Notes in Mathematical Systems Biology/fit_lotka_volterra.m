function  fit_lotka_volterra

global H
global L
global years
 lvdata
 years=0:1:20;
 guess = [1; 0.02; 0.02; 1];
 [p,error]=fminsearch(@lverr, guess);
 initial_guess = guess'
 found_parameters = p'
 error_for_these = error
 [t,y]=ode45(@lvrhs,years,[H(1);L(1)],[],p);
 subplot(2,1,1)
 plot(t,y(:,1),years,H,'o','linewidth',3)
 title('Fit to prey')
 subplot(2,1,2)
 plot(t,y(:,2),years,L,'o','linewidth',3)
 title('Fit to predator')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function value = lvrhs(t,y,p)
  value=[p(1)*y(1)-p(2)*y(1)*y(2);-p(4)*y(2)+p(3)*y(1)*y(2)];
end %lvrhs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function error = lverr(p)
  [t,y] = ode45(@lvrhs,years,[H(1);L(1)],[],p);
  value = (y(:,1)-H')+(y(:,2)-L');
  error = sum(value);
end %lverr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function lvdata
  H=[30 47.2 70.2 77.4 36.3 20.6 18.1 21.4 22 25.4 27.1 ...
     40.3 57 76.6 52.3 19.5 11.2 7.6 14.6 16.2 24.7];
  L=[4 6.1 9.8 35.2 59.4 41.7 19 13 8.3 9.1 7.4 ...
     8 12.3 19.5 45.7 51.1 29.7 15.8 9.7 10.1 8.6];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end %program
