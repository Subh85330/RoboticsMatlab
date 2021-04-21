clc
clear all
close all
J = [0 1];
qi = [0 0.15];
qf = [2.0944 0.3];
T = 10;
incr = 0.1;

Vr=0.3; Vp=0.02;
tf=T;
dqi12=[0;0];
dqf12=[0;0];
j=1;
for t=0:incr:T
    
for i=1:length(J)
    if J(i)==0
        qi1=qi(1); qf1=qf(1); dqi1=dqi12(1); dqf1=dqf12(1);
        V=Vr;
        tb=(qi1-qf1+V*tf)/V;
    else
      qi1=qi(2); qf1=qf(2); dqi1=dqi12(2); dqf1=dqf12(2);
      V=Vp;
      tb=(qi1-qf1+V*tf)/V;
    end
    
    if t>=0&&t<=tb
     q(:,i)=qi1+V/(2*tb)*t^2;
     dqi(:,i)=V/tb*t;
     ddqi(:,i)=V/tb;
    elseif t>tb&&t<=(tf-tb)
        q(:,i)=(qi1+qf1-V*tf)/2+V*t;
        dqi(:,i)=V;
        ddqi(:,i)=0;
    else 
        q(:,i)=qf1-(V/(2*tb))*(tf^2)+(V/tb)*tf*t-(V/(2*tb))*(t^2);
        dqi(:,i)=(V/tb)*tf-(V/tb)*t;
        ddqi(:,i)=-V/tb;
    end
end



time(j)=t;
    qplot(:,j) = q;
    dqplot(:,j) = dqi;
    ddqplot(:,j) = ddqi;

j=j+1;
end

for i=1:2
 figure(3)
 hold on
 subplot(3,1,1)

 plot(time,qplot(i,:))
 legend('thetaR','dispP')
 xlabel('time')
 ylabel('q')
 
 
 hold on
 subplot(3,1,2)
 plot(time,dqplot(i,:))
 legend('VelR','VelP')
  xlabel('time')
 ylabel('dq')
 
 hold on
 subplot(3,1,3)
 plot(time,ddqplot(i,:))
 legend('accR','accP')
  xlabel('time')
 ylabel('ddq')
 hold off
end