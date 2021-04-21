% practical2
clear
clc
close all

% Input parameters
m = 1; l = 1; lc = 0.5; Izz = (1/3)*m*(l^2); g = 9.81;

%initial state

y1_0=0;
y2_0=0;
ti=0;
tf=3;

[t,y]=ode45(@practical2_diff,[ti,tf],[y1_0; y2_0]);

T=t;
Y1=y(:,1)
Y2=y(:,2);

for i=1:length(T)
    dy=practical2_diff(T(i), [Y1(i), Y2(i)]);
    dY2(i)=dy(2);
    
    x2 = l*cos(Y1(i)); y2 = l*sin(Y1(i))
    x0(i, 1) = x2 
    y0(i, 1) = y2
    plot([0 x2],[0 y2], x0, y0)
    xlabel('X-axis')
    ylabel('Y-axis')
    title("Free fall animation of one link robot")
    axis([-2 2 -2 2])
    pause(0.1)
    
    
end




plot(T,Y1,'-o',T,Y2,'-o',T,dY2,'-o')
title('Foward dynamics of 1 link Robot')
xlabel('Time t')
ylabel('Solution y')
legend('y_1','y_2','dy_3')