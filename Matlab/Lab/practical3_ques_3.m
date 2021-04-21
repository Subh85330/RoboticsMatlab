clc
clear all

alpha=[0 -90 0 -90 90 -90];
ai=[0 0 0.4 0 0 0];
di=[0 0.4 0 0.4 0 0];
theta=[30 30 60 45 60 45];
n=6;
den=[0; 0; di(6)];

%theta=[0 90 -90 0 0 0]
Temp = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];

for i=1:n
    T_i_i_1= [cosd(theta(i)) -sind(theta(i)) 0 ai(i); sind(theta(i))*cosd(alpha(i)) cosd(theta(i))*cosd(alpha(i)) -sind(alpha(i)) -sind(alpha(i))*di(i); sind(theta(i))*sind(alpha(i)) cosd(theta(i))*sind(alpha(i)) cosd(alpha(i)) cosd(alpha(i))*di(i); 0 0 0 1];
    
    Ti0(:,:,i)=Temp*T_i_i_1;
    Temp=Ti0(:,:,i);
    
    Oi0(1:3,i)=Ti0(1:3,4,i);
    
end
X=Oi0(1,:);
Y=Oi0(2,:);
Z=Oi0(3,:);
plot3(X,Y,Z)
title('Configuration of the robot for question 3')
xlabel('X-axis')
ylabel('Y-axis')
zlabel('Z-axis')
Pe0=Oi0(:,6) + Ti0(1:3,1:3,6)*(den);