clear
close all
clc
lmbda = 0.5;
thetaF=[60;240];
delta_t = 0.001;

k=1;
l1=1;
l2=1;
[Oe0, Ri0, Oi0] = practical9_forkin(thetaF);
[pc,u,v,sd] = practical9_perspective(Ri0,Oe0);
% sd=s;

t = 0;
theta = [0;0];
e=1;
i=1;
while norm(e)>=0.003
    [Oe0, Ri0, Oi0] = practical9_forkin(theta);
    [pc,u,v,s] = practical9_perspective(Ri0,Oe0);
    e=(s-sd);
    y = norm(e)
    L = [-lmbda/pc(3)  0                v
        0              -lmbda/pc(3)    -u];
    
    Jc = [l1*sind(theta(2))       0
        l1*cosd(theta(2))+l2    l2
        1                       1];
    
    Lm = L*Jc;
    dtheta = -k*pinv(Lm)*e;
    
    
    
    X = [Oi0(1,:) Oe0(1,1)];
    Y = [Oi0(2,:) Oe0(2,1)];
    %    Z = Oi0(3,:);
    figure(1)
    plot(X, Y)
    axis([-2 2 -2 2])
    pause(0.0001)
    
    thetaNew = theta + dtheta*delta_t*(180/pi);
    theta = thetaNew;
    
    %plot
    time(i,1) = t;
    error(i,1) = norm(e);
    vel(i,:) =  dtheta;
    
    t = t + delta_t;
    i=i+1;
end

figure(2)
subplot(3,1,1)
plot(time, error)
xlabel("Time(sec)")
ylabel("Error(s-sd)")
title("error")

subplot(3,1,2)
plot(time, vel(:,1))
xlabel("Time(sec)")
ylabel("dtheta_1")
title("vel_1")

subplot(3,1,3)
plot(time, vel(:,2))
xlabel("Time(sec)")
ylabel("dtheta_2")
title("vel_2")
