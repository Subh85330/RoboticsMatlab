clear
clc
close all
[n, J, m, l, dxcom, dycom, dzcom, Ixx, Iyy, Izz, Ixy, Iyz, Izx, a, alp, d, th, qi, qf, dEn, incr, g, T] = Inputs();
j=1;
TR=["Revolute","Prismatic"];
for t=0:incr:T
    
    
    
%      [q, dqi, ddqi] = traj(qi,qf,t,T);         
%       time(j)=t;
%      qplot(j,:) = q;
%     dqplot(j,:) = dqi;
%     ddqplot(j,:) = ddqi;
%     
%     
%      [q,dqi,ddqi] = cubictraj(t);
%        q2plot(j,:) = q;
%     dq2plot(j,:) = dqi;
%     ddq2plot(j,:) = ddqi;
%     
%     
%     [q,dqi,ddqi] = quantictraj(t);
%     
%     q3plot(j,:) = q;
%     dq3plot(j,:) = dqi;
%     ddq3plot(j,:) = ddqi;
%     
%     
%    [q,dqi,ddqi] = linear_trajD(J,qi,qf,T,t);
%       q4plot(j,:) = q;
%     dq4plot(j,:) = dqi;
%     ddq4plot(j,:) = ddqi;
    
  
    
    [q5plot dq5plot ddq5plot time1]=bang(qi,qf,T);
%     q5plot(:,j) = q;
%     dq5plot(j,:) = dqi;
%     ddq5plot(j,:) = ddqi;

    
   
    j=j+1;    
end



for i=1:2


figure()

 plot(time1,q5plot(:,i))           % time,qplot(:,i),time,q2plot(:,i),time,q3plot(:,i),time,q4plot(:,i),
  title(TR(i))
 legend('disBang')                     % 'disCyc','disCub','disQu','dislin',
 xlabel('time')
 ylabel('q')
 
 
 hold on
 figure()
 plot(time1,dq5plot(:,i))              % time,dqplot(:,i),time,dq2plot(:,i),time,dq3plot(:,i),time,dq4plot(:,i),
 title(TR(i))
 legend('VelBang')             % 'VelCyc','VelCub','VelQu','Vellin',
  xlabel('time')
 ylabel('dq')
 
 hold on
 figure()
 plot(time1,ddq5plot(:,i))         % time,ddqplot(:,i),time,ddq2plot(:,i),time,ddq3plot(:,i),time,ddq4plot(:,i),
  title(TR(i))
 legend('AccBang')                 % 'AccCyc','AccCub','AccQu','Acclin',
  xlabel('time')
 ylabel('ddq')
 hold off
 
 
end