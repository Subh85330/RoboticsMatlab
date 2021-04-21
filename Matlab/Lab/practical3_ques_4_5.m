clc
clear
close all

xmin=-1.5; xmax=1.5; ymin=-1.5; ymax=1.5; zmin=-1.5; zmax=1.5;
alpha=[0 90 0 -90 90 -90];
ai=[0 0 0.4 0 0 0];
di=[0 -0.4 0 0.4 0 0];
thetai=[0 90 -90 0 0 0];
thetaf=[0 90 -90 0 0 0]+30;
n=6;
den=[0; 0;0.4];
% thetai = [0 0 30 15 30 15];
% thetaf = [30 30 60 45 60 45];
%
for j = 1:90
    theta = thetai + ((thetaf-thetai)/90)*j;
    Temp = eye(4,4);
    for i=1:n
        T_i_i_1= [cosd(theta(i))                 -sind(theta(i))                        0                   ai(i)
                  sind(theta(i))*cosd(alpha(i))   cosd(theta(i))*cosd(alpha(i))   -sind(alpha(i))  -sind(alpha(i))*di(i)
                  sind(theta(i))*sind(alpha(i))   cosd(theta(i))*sind(alpha(i))    cosd(alpha(i))   cosd(alpha(i))*di(i)
                    0                                   0                                 0                    1       ];
        
        
        Ti0(:,:,i) = Temp*T_i_i_1;
        Temp=Ti0(:,:,i);
        
        Oi0(1:3,i)=Ti0(1:3,4,i);
    end
    
    Pe0=Oi0(:,6) + Ti0(1:3,1:3,6)*(den);
    Oi0(:,7)=Pe0;
    X=Oi0(1,:);
    Y=Oi0(2,:);
    Z=Oi0(3,:);
    plot3(X,Y,Z)
    xlabel('X-axis')
    ylabel('Y-axis')
    zlabel('Z-axis')
    title("animation")
    axis([xmin xmax ymin ymax zmin zmax])
    pause(0.5)
    
end

% ZYZ Euler angles

R6_0 = Ti0(1:3,1:3,6);

Y_angle = atan2(sqrt(1-R6_0(3,3)^2),R6_0(3,3));

if sin(Y_angle) >0
    Z1_angle = atan2(R6_0(2,3),R6_0(1,3));
    Z2_angle = atan2(R6_0(3,2),-R6_0(3,1));
elseif sin(Y_angle) >0
    Z1_angle = atan2(-R6_0(2,2),-R6_0(1,3));
    Z2_angle = atan2(-R6_0(3,2),R6_0(3,1));
end

ZYZ_Euelr_angles = [Z1_angle, Y_angle, Z2_angle];