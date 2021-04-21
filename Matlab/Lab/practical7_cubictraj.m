function [q dqi ddqi] = practical7_cubictraj(t)

qr =- (pi*t^3)/750 + (pi*t^2)/50;
dqr =(pi*t)/25 - (pi*t^2)/250;
ddqr =pi/25 - (pi*t)/125;


 
qp =- (3*t^3)/10000 + (9*t^2)/2000 + 3/20;
dqp =(9*t)/1000 - (9*t^2)/10000;
ddqp =9/1000 - (9*t)/5000;


q=[qr qp];
dqi=[dqr dqp];
ddqi=[ddqr ddqp];
end





% code used to obtain the above equations

% syms t
% t0=0;
% tf=10;
% v0=0;
% vf=0;
% q0=0.15;
% qf=0.3;
% 
% Tmat = [  1  t0  (t0)^2  (t0)^3
%     0  1   2*t0  3*(t0)^2
%     1  tf  (tf)^2  (tf)^3
%     0  1   2*tf  3*(tf)^2   ];
% Qini =  [q0;v0;qf;vf];
% a = inv(Tmat)*Qini;
% q = a(1) + a(2)*t + a(3)*(t^2) + a(4)*(t^3)
% dq = a(2) + 2*a(3)*t + 3*a(4)*(t^2)
% ddq = 2*a(3) + 6*a(4)*t

