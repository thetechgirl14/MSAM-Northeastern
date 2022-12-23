% run it a few times!

%File gillespie_rev1.m
%stochastic simulation of -> X -> Y -> with rates p, q, r

clear all

%set parameter values
p=10;
q=1;
r=2;
%set number of reactions
Tend=10000;
%set initial conditions for # molecules and for time t 
X=zeros(Tend,2);
t=zeros(Tend,1);
X(1,:)=[0 0]; t(1)=0;

j=1;
    while j<Tend
    %calculate propensities
    a1=p;
    a2=q*X(j,1);
    a3=r*X(j,2);
    asum=a1+a2+a3;

    %select next reaction
    mu=rand(1);
    z1=0;z2=0;z3=0;
    if 0 <= mu && mu < a1/asum
       z1=1;
    else if a1/asum <= mu && mu  < (a1+a2)/asum
            z2=1;
         else 
            z3=1;
         end
    end

    %update state
    X(j+1,1) = X(j,1) + z1 -z2;
    X(j+1,2) = X(j,2) + z2 -z3;
    %update time
    t(j+1) = t(j) + log(1/rand(1))/asum;
    %update counter
    j=j+1;
end

subplot(2,1,1)
stairs(t, X(:,1), 'k', 'linewidth', 2)
ylabel('number of molecules')
xlabel('time')
title('X')

subplot(2,1,2)  
stairs(t, X(:,2), 'g', 'linewidth', 2)
ylabel('number of molecules')
xlabel('time')
title('Y')
  
meanX = diff(t)'*X(1:end-1,1)/t(end)
meanY = diff(t)'*X(1:end-1,2)/t(end)
secX  = diff(t)'*X(1:end-1,1).^2/t(end);  % second moment
secY  = diff(t)'*X(1:end-1,2).^2/t(end);  % second moment
varX = secX - meanX^2
varY = secY - meanY^2
corXY = diff(t)'*(X(1:end-1,1).*X(1:end-1,2)) / t(end);  % correlation
covXY = corXY - meanX*meanY
