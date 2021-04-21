clc
clear
close all
qi = [0 0.15];
qf=[120*pi/180 0.3];
T=10;
n=2;
incr = T/100;
al=0.3;
dqi12=[0;0];
dqf12=[0;0];
j=1;
J=[0 1];
for t=0:incr:T
    
for i=1:length(J)
    if J(i)==0
        qi1=qi(1); qf1=qf(1); dqi1=dqi12(1); dqf1=dqf12(1);
        ts=sqrt((qf1-qi1)/al);
        V=al*ts;
        tf=2*ts;
        tfr=tf;
    else
      qi1=qi(2); qf1=qf(2); dqi1=dqi12(2); dqf1=dqf12(2);
       ts=sqrt((qf1-qi1)/al);
        V=al*ts;
        tf=2*ts;
        tfp=tf;
    end
    
    if t>=0&&t<=ts
     q(:,i)=qi1+V/(2*ts)*t^2
     dqi(:,i)=V/ts*t;
     ddqi(:,i)=V/ts;
    elseif t>ts&&t<=(tf-ts)
        q(:,i)=(qi1+qf1-V*tf)/2+V*t;
        dqi(:,i)=V;
        ddqi(:,i)=0;
    elseif t>(tf-ts)&&t<=tf
        q(:,i)=qf1-V/(2*ts)*tf^2+V/ts*tf*t-V/(2*ts)*t^2;
        dqi(:,i)=V/ts*tf-V/ts*t;
        ddqi(:,i)=-V/ts;
    end
end
    time1(j)=t;
    q5plot(j,:) = q;
    dq5plot(j,:) = dqi;
    ddq5plot(j,:) = ddqi;

j=j+1;
end

for i=1:2
 figure(3)
 hold on
 subplot(3,1,1)

 plot(time1,q5plot(:,i))
 legend('thetaR','dispP')
 xlabel('time')
 ylabel('q')
 
 
 hold on
 subplot(3,1,2)
 plot(time1,dq5plot(:,i))
 legend('VelR','VelP')
  xlabel('time')
 ylabel('dq')
 
 hold on
 subplot(3,1,3)
 plot(time1,ddq5plot(:,i))
 legend('accR','accP')
  xlabel('time')
 ylabel('ddq')
 hold off
end