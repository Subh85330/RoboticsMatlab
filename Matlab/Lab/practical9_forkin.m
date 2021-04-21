function [Oe0, Ri0, Oi0] = practical9_forkin(theta)
alpha=[0 0];
ai=[0 1];
di=[0 0];
% theta=[0 0];
n=2;
den=[0;1;0];

%theta=[30 30 60 45 60 45]
Temp = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];

for i=1:n
    T_i_i_1= [cosd(theta(i))                     -sind(theta(i))                    0                  ai(i)
              sind(theta(i))*cosd(alpha(i))     cosd(theta(i))*cosd(alpha(i))   -sind(alpha(i))     -sind(alpha(i))*di(i)
              sind(theta(i))*sind(alpha(i))     cosd(theta(i))*sind(alpha(i))    cosd(alpha(i))     cosd(alpha(i))*di(i)
              0                                      0                              0                    1              ];
    
    Ti0(:,:,i)=Temp*T_i_i_1;
    
    
    Ri0(:,:,i)=Ti0(1:3,1:3,i);
    
    Temp=Ti0(:,:,i);
    Oi0(1:3,i)=Ti0(1:3,4,i);
    
end
 Oe0=Oi0(:,2) + Ti0(1:3,1:3,2)*(den);
% Oi0(:,3)=Pe0;
% 
% X=Oi0(1,:);
% Y=Oi0(2,:);
% Z=Oi0(3,:);
% plot3(X,Y,Z)
% axis([-1.5 1.5 -1.5 1.5 -1.5 1.5])

end