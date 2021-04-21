clc; clear;
%initial state

y1_0=0;
y2_0=0;
ti=0;
tf=3;

[t,y]=ode45(@Diff,[ti,tf],[y1_0; y2_0]);

T=t;
Y1=y(:,1);
Y2=y(:,2);

for i=1:length(T)
    dy=Diff(T(i), [Y1(i), Y2(i)]);
    dY2(i)=dy(2);
    
    
end




plot(T,Y1,'-o',T,Y2,'-o',T,dY2,'-o')
title('Foward dynamics of 1 link Robot')
xlabel('Time t')
ylabel('Solution y')
legend('y_1','y_2','dy_3')