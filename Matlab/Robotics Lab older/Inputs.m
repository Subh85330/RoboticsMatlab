function [n, J, m, l, dxcom, dycom, dzcom, Ixx, Iyy, Izz, Ixy, Iyz, Izx, a, alp, d, th, qi, qf, dEn, incr, g, T, t] = Inputs()

n=2; 
J = [0 1];%joint type
T = 10;
m=[0.5 0.5];
l=[0.3 0.3];

%center of mass
dxcom = [0.15 0];
dycom = [0 0];
dzcom = [0 0.15];%in body fixed frame
    
%Inertia moment
Ixx =[0                      1/(12*m(2)*l(2)*l(2))];
Iyy =[1/(12*m(1)*l(1)*l(1))   1/(12*m(2)*l(2)*l(2))]; %in body fixed frame
Izz =[1/(12*m(1)*l(1)*l(1))           0];
Ixy =[0                               0];
Iyz =[0                                  0];
Izx =[0                                 0];
    
  
    
    
    
    
    

a=[0; 0.3];
alp=[0,-90]*pi/180;
d=[0,0.15];
th=[0,0]*pi/180;
qi = [0*pi/180, 0.15];
qf=[120*pi/180, 0.3];
dEn=[0;0;0.3];

 
step=1000;
incr = T/100;
t=0:incr:T;
g=[0;-9.81;0];



end