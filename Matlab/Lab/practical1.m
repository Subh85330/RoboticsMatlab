%Practle 1
clc
clear
close all

%Input: Model Parameters

m = 1; l = 1; lc = 0.5; Izz = (1/3)*m*l^2; g = 9.81; step = 0.01;

%Input: Trajectory Parameters
d2r=pi/180;
th0=0*d2r; thT=120*d2r; T=3;

xmin=-1.2*l; xmax=1.2*l; ymin=-1.2*l; ymax=1.2*l;

i=1;
for t=0:step:3
    th(i,1) = th0+((thT-th0)/T)*(t-(T/(2*pi))*sin(2*pi*t/T));
    time(i,1) = t;
    
    
    vel(i,1) = ((thT-th0)/T)*(1-cos(2*pi*t/T));
    
    
    acc(i,1) = ((thT-th0)/T)*((2*pi/T)*sin(2*pi*t/T));
    
    torque(i,1) = Izz*acc(i)+ m*g*lc*cos(th(i));
    
    x0=0;y0=0; x1=l*cos(th(i)); y1=l*sin(th(i));
    xx=[x0, x1]; yy=[y0, y1];
    
    x2(i,1)=x1; y2(i,1)=y1;
    
    figure(1)
    plot(xx,yy,x2,y2)
    xlabel('X-axis')
    ylabel('Y-axis')
    title("Force analysis(Inverse Dynammics of 1-link  Robot")
    axis([xmin xmax ymin ymax]);
    pause(0.01)
    
    i=i+1;
end
figure(2)
subplot(2,1,1)
plot(time,th,'--',time,vel,time,acc,'-.')
xlabel('Time(s)')
ylabel('th(rad)')
legend('angular displacement(rad)','velocity(rad/s)','acceleration(rad/s^2)')

subplot(2,1,2)
plot(time,torque)
xlabel('Time(s)')
ylabel('torque')
legend('torque')
