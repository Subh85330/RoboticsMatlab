clc;
clear all;

syms th1 th2 d3 th4 l1 l2

alpha=[0;0;180;0];
ai=[0;l1;l1;0];
di=[0;0;d3;0];

theta=[th1;th2;0;th4];

jtype = [0 0 1 0]; %Enter 0 for revolute and 1 for prismatic joint


n=4;
den=[0; 0;0.4];
Temp = eye(4,4);

for i=1:n
    T_i_i_1= [cosd(theta(i))                     -sind(theta(i))                        0                       ai(i)           ; 
              sind(theta(i))*cosd(alpha(i))     cosd(theta(i))*cosd(alpha(i))      -sind(alpha(i))      -sind(alpha(i))*di(i)   ;
              sind(theta(i))*sind(alpha(i))     cosd(theta(i))*sind(alpha(i))       cosd(alpha(i))       cosd(alpha(i))*di(i)   ; 
                     0                                      0                                 0                 1                   ];
       
    Ti0(:,:,i)=Temp*T_i_i_1;
    Temp=Ti0(:,:,i);
    
    Oi0(1:3,i)=Ti0(1:3,4,i);
    zi0(1:3,i)=Ti0(1:3,3,i);
    
 
end
Pe0=Oi0(:,n) + Ti0(1:3,1:3,n)*(den);
Oi0(:,7)=Pe0;

for j=1:n
    if jtype(j) == 0
        a=zi0(1:3,j);
        b=Pe0-Oi0(1:3,j);
        J(1:3,j)=[a(2)*b(3)-a(3)*b(2);
                  a(3)*b(1)-a(1)*b(3);
                  a(1)*b(2)-a(2)*b(1)];
        J(4:6,j)=zi0(1:3,j);
    elseif jtype == 1
        J(1:3,j) = zi0(1:3,j);
        J(4:6,j) = 0;
    end
    
end
J;
Jac=simplify(J)
          