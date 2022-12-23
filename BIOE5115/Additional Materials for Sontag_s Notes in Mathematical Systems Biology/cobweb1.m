  % make sure to write "@" in argument; for example:
  % cobweb1(@nextstate,0,1,0.2,20)
  % where the iteration function is in a separate file nextstate.m


function cobweb1(f,a,b,x0,N)

% generate the cobweb plot associated with
% the orbits x_n+1=f(x_n).
% N is the number of iterates, and
% (a,b) is the interval
% x0 is initial point

pausetime=0.2;  % pause between segments
% generate N linearly space values on (a,b)
x=linspace(a,b,10*N);
% which we use to plot the function y=f(x)
y=f(x);

plot(x,y,'k'); % plot the function
hold on
plot(x,x,'r'); % plot the diagonal
hold off
x(1)=x0; % will plot orbit starting at x0 and store values in x

for i=1:N
    x(i+1)=f(x(i));
    line([x(i),x(i)],[x(i),x(i+1)]);
    line([x(i),x(i+1)],[x(i+1),x(i+1)]);
pause(pausetime)
end
