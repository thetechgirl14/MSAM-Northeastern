function iterate(F,x0,N)
fprintf('Change axis command for different window size');
j=0:1:N;
iterate=zeros(N+1,1);
iterate(1)=x0;
for i=2:N+1iter
iterate(i)=F(iterate(i-1));
end
answers = [j' iterate]
%plot(j,iterate)
scatter(j,iterate)
axis([0 N+1 0 max(iterate)]);
end
