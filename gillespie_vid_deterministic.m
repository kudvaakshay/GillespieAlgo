%Deterministic
%Author: Akshay Kudva
% Chemical Engineering Friends
clc
clear
clf
%Define constants
C1 = 2;
C2 = 1;
% Initial values defined in the problem
XA0 = 5;
XB0 = 10;
T = 10;
%Note X(1)=XA; X(2)=XB
dydx = @(t,X) [-C1*X(1)+C2*X(2); -C2*X(2)+C1*X(1) ];
X0 = [XA0,XB0];
tspan=linspace(0,T,1000);

%Plotting:
figure(1)
[t,X]=ode15s(dydx,tspan,X0); %ode solver
plot(t,X(:,1),'r--','LineWidth',2);
hold on
plot(t,X(:,2),'-','LineWidth',2);
legend("CA","CB");
if XB0>XA0
axis([0 T XA0-5 XB0+5])
else
axis([0 T XB0-5 XA0+5])   
end
xlabel("Time")
ylabel("Number of molecules")
