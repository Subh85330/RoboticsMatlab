clear
clc
close all
[n, J, m, l, dxcom, dycom, dzcom, Ixx, Iyy, Izz, Ixy, Iyz, Izx, a, alp, d, th, qi, qf, dEn, incr, g, T] = practical5_Inputs();
j=1;
TR=["Revolute","Prismatic"];
for t=0:incr:T
    
    
    
     [q, dqi, ddqi] = practical7_traj(qi,qf,t,T);         
      time(j)=t;
     qplot(j,:) = q;
    dqplot(j,:) = dqi;
    ddqplot(j,:) = ddqi;
    
    
     [q,dqi,ddqi] = practical7_cubictraj(t);
       q2plot(j,:) = q;
    dq2plot(j,:) = dqi;
    ddq2plot(j,:) = ddqi;
    
    
    [q,dqi,ddqi] = practical7_quantictraj(t);
    
    q3plot(j,:) = q;
    dq3plot(j,:) = dqi;
    ddq3plot(j,:) = ddqi;
    
    
   [q,dqi,ddqi] = practical7_linear_trajD(J,qi,qf,T,t);
      q4plot(j,:) = q;
    dq4plot(j,:) = dqi;
    ddq4plot(j,:) = ddqi;
    
  
    
    [q5plot dq5plot ddq5plot]=practical7_bigbang_traj(qi,qf,T);
%     q5plot(j,:) = q;
%     dq5plot(j,:) = dqi;
%     ddq5plot(j,:) = ddqi;

    
   
    j=j+1;    
end



for i=1:2


figure()

 plot(time,qplot(:,i),time,q2plot(:,i),time,q3plot(:,i),time,q4plot(:,i),time,q5plot(:,i))   
  title(TR(i))
 legend('disCyc','disCub','disQu','dislin','disBang')
 xlabel('time')
 ylabel('Displacement(q)')
 
 
 hold on
 figure()
 plot(time,dqplot(:,i),time,dq2plot(:,i),time,dq3plot(:,i),time,dq4plot(:,i),time,dq5plot(:,i))   
 title(TR(i))
 legend('VelCyc','VelCub','VelQu','Vellin','VelBang')
  xlabel('time')
 ylabel('Velocity(dq)')
 
 hold on
 figure()
 plot(time,ddqplot(:,i),time,ddq2plot(:,i),time,ddq3plot(:,i),time,ddq4plot(:,i),time,ddq5plot(:,i)) 
  title(TR(i))
 legend('AccCyc','AccCub','AccQu','Acclin','AccBang')
  xlabel('time')
 ylabel('Acceleration(ddq)')
 hold off
 
 
end