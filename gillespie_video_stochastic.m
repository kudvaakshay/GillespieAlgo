%stochastic
%clf
gillespie_vid_deterministic;
%Stochastic part
%%%%%%%%%%%%%%%%%%%%%%%Stuff defined in the problem %%%%%%%%%%%%%%%%%%%%%%
%time array is stime
% C1 = 2;
% C2 = 1;
% % Initial values defined in the problem
% XA0 = 10;
% XB0 = 0;
% T = 10;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

XA(1) = XA0; 
XB(1) = XB0;

st(1) = 0;
i = 1; % For while loop
time = 0;
while time<T

% Step 1:  Calculate rate of reaction h1*c1, h2*c2,…  a0 = sum(hn*cn)

rates = zeros(1,2);
rates(1) = C1*XA(i);
rates(2) = C2*XB(i);


a0 = sum(rates); %=a as given in the transcript
%For tau- find next time point

%Step 2: Generate random numbers eps1 and eps 2
eps1 = rand;

tau = -(1/a0)*log(eps1);
st(i+1) = st(i)+tau;
time = st(i+1);
eps2 = rand;
if eps2 <= rates(1)/a0
   
    XA(i+1) = XA(i) - 1;
    XB(i+1) = XB(i) + 1;
    
else
    XA(i+1) = XA(i)+1;
    XB(i+1) = XB(i)-1;
    
end

i = i+1;
end

plot(st,XA,'-o')
hold on
plot(st,XB,'-o')
if XB0>XA0
axis([0 T XA0-5 XB0+5])
else
axis([0 T XB0-5 XA0+5])   
end
legend('Deterministic XA','Deterministic XB','Stochastic XA','Stochastic XB')
xlabel('time')
ylabel('Number of molecules')
