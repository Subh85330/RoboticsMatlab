clear
close all
clc
lmbda = 0.5;
theta=[60 240];
delt = 0.001;
k=1;
l1=1;
l2=1;
[Oe0,Ri0] = forkinP9(theta);

[pc,u,v,s] = perspective(Ri0,Oe0);
sd=s;

theta = [0 0];
e=inf;
 while norm(e)>=0.0001
[Oe0,Ri0] = forkinP9(theta);

[pc,u,v,s] = perspective(Ri0,Oe0);  
 e=s-sd;
 norm(e)
 L = [-lmbda/pc(3)  0                v
     0              -lmbda/pc(3)    -u]; 
 
 Jc = [l1*sind(theta(2))     0
       l1*cosd(theta(2))+l2  l2
       1                       1];
   
 Lm = L*Jc;
 dtheta = -k*pinv(Lm)*e;
 
 thetaNew = theta + dtheta*delt;
 theta = thetaNew;
 end
