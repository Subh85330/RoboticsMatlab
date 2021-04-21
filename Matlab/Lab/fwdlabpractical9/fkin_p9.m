function[R_2_0,O_c_0,Oi0]=fkin_p9(theta)
n=2;
dEn=[0;1;0];    %end effector offset

% DH paameter
alpha=[0 0]*pi/180;
ai=[0 1];
di=[0 0];
% theta=[0 0]*pi/180; % initially th1=0,th2=0

Temp=eye(4); 
for i=1:n
    
    Ti= [cos(theta(i))              -sin(theta(i))                      0                  ai(i);
        sin(theta(i))*cos(alpha(i)) cos(theta(i))*cos(alpha(i))   -sin(alpha(i))      -sin(alpha(i))*di(i);
        sin(theta(i))*sin(alpha(i)) cos(theta(i))*sin(alpha(i))   cos(alpha(i))        cos(alpha(i))*di(i);
        0                              0                               0                      1];
    
    Ti0(1:4,1:4,i)=Temp*Ti;
    Temp=Ti0(1:4,1:4,i);
    Oi0(1:3,i)=Ti0(1:3,4,i);
end
R_2_0 = Ti0(1:3,1:3,n) ;
% O_2_0 = Oi0(1:3,n);
O_e_0=Oi0(1:3,n)+Ti0(1:3,1:3,n)*dEn;
O_c_0=O_e_0;
end
