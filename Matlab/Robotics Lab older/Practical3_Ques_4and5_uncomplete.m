clc
clear all
xmin=-1.5; xmax=1.5; ymin=-1.5; ymax=1.5; zmin=-1.5; zmax=1.5;
alpha=[0 90 0 -90 90 -90];
ai=[0 0 0.4 0 0 0];
di=[0 -0.4 0 0.4 0 0];
theta1=0:30/90:30;
theta2=0:30/90:30;
theta3=30:30/90:60;
theta4=15:30/90:45;
theta5=30:30/90:60;
theta6=15:30/90:45;
% theta=[30 30 60 45 60 45];
n=6;
den=[0; 0;0.4];

%theta=[30 30 60 45 60 45]
Temp = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
for k=1:1:91
    theta=[theta1(k) theta2(k) theta3(k) theta4(k) theta5(k) theta6(k)];
for i=1:n
    
    
    
    T_i_i_1= [cosd(theta(i)) -sind(theta(i))                                    0 ai(i)
              sind(theta(i))*cosd(alpha(i)) cosd(theta(i))*cosd(alpha(i))   -sind(alpha(i))      -sind(alpha(i))*di(i)
              sind(theta(i))*sind(alpha(i)) cosd(theta(i))*sind(alpha(i))   cosd(alpha(i))        cosd(alpha(i))*di(i);
              0                              0                               0                   1];
    
    Ti0(:,:,i)=Temp*T_i_i_1;
    Temp=Ti0(:,:,i);
    
    Oi0(1:3,i)=Ti0(1:3,4,i);
    
end
Pe0=Oi0(:,6) + Ti0(1:3,1:3,6)*(den);
Oi0(:,7)=Pe0;

X=Oi0(1,:);
Y=Oi0(2,:);
Z=Oi0(3,:);
plot3(X,Y,Z)
axis([xmin xmax ymin ymax zmin zmax])
pause(0.5)
end