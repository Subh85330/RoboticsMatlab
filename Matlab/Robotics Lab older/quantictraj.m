function [q dqi ddqi] = quantictraj(t)

qr =(pi*t^5)/25000 - (pi*t^4)/1000 + (pi*t^3)/150;
 
dqr =(pi*t^4)/5000 - (pi*t^3)/250 + (pi*t^2)/50;
 
ddqr =(pi*t^3)/1250 - (3*pi*t^2)/250 + (pi*t)/25;


 
qp =(5312662293228349*t^5)/590295810358705651712 - (9*t^4)/40000 + (3*t^3)/2000 + 3/20;
 
dqp =(1660206966633859*t^4)/36893488147419103232 - (9*t^3)/10000 + (9*t^2)/2000;

ddqp =(9*t^3)/50000 - (27*t^2)/10000 + (9*t)/1000;


q=[qr qp];
dqi=[dqr dqp];
ddqi=[ddqr ddqp];
end





%  code which is used to obtain the above codes
% syms t
% t0=0;
% tf=10;
% v0=0;
% vf=0;
% alpha0=0;
% alphaf=0;
% q0=0.15;
% qf=0.3;
% 
% Tmat = [  1  t0  (t0)^2  (t0)^3    (t0)^4      (t0)^5
%           0  1   2*t0    3*(t0)^2   4*(t0)^3    5*(t0)^4
%           0  0    2      6*t0        12*t0^2    20*t0^3   
%           1  tf  (tf)^2  (tf)^3    (tf)^4      (tf)^5
%           0  1   2*tf    3*(tf)^2   4*(tf)^3    5*(tf)^4
%           0  0    2      6*tf        12*tf^2    20*tf^3
%           
%           ];
% 
% Qini =  [q0;v0;alpha0;qf;vf;alphaf];
% a = inv(Tmat)*Qini;
% 
% q = a(1) + a(2)*t + a(3)*(t^2) + a(4)*(t^3) +a(5)*(t^4) + a(6)*(t^5)
% 
% dq =        a(2) + 2*a(3)*t + 3*a(4)*(t^2) + 4*a(5)*t^3 + 5*a(6)*t^4
% 
% ddq =  2*a(3) + 6*a(4)*(t) + 12*a(5)*t^2 + 20*a(6)*t^3


