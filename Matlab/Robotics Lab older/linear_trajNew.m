clc; clear all;
V=0.3;
qi = [0*pi/18 0.15];
qf=[120*pi/180 0.3];
J=[0 1];
T=10;
incr = T/100;
t=0:incr:T;


for j=1:length(J)
i=1;
tb(j) =(qi(j)-qf(j)+V*T)/V;

a_acc(j) = V/tb(j);


for t = 0:incr:T
    
    if t>=0 & t<=tb
        q(j) = qi(j) + (a_acc(j)/2)*t^2;
        dqi(j) = a_acc(j)*t;
        ddqi(j) = a_acc(j);
        
    elseif t>tb & t<=(T-tb)
        q(j) = (qf(j) + qi(j) - V*T)/2 + V*t;
        dqi(j) = V;
        ddqi(j) = 0;
        
    elseif t>(T-tb) & t<=T
        q(j) = qf(j) - (a_acc(j)/2)*(T^2)+a_acc(j)*T*t-(a_acc(j)/2)*t^2;
        dqi(j) = a_acc(j)*(T-t);
        ddqi(j) = -a_acc(j);
        
    end
    time(i) = t;
    
    q1(j,i)=q(j);
    dq1(j,i) = dqi(j);
    ddq1(j,i) = ddqi(j);
    i=i+1;
end

figure(1)
hold on
plot(time,q1(j,:))
hold off

figure(2)
hold on
plot(time,dq1(j,:))
hold off

figure(3)
hold on
plot(time,ddq1(j,:))
hold off
% axis([0 1 -60 65])

end