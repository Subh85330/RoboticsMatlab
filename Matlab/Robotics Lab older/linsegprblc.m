function[q,dqi,ddqi]=linsegprblc(J,qi,qf,T,t,j)

% t0=0; 
Vr=.3; Vp=.02;
tf=T;
dqi=[0;0];
dqf=[0;0];
for i=1:length(J)
    if J(i)==0
        qi1=qi(1); qf1=qf(1); dqi1=dqi(1); dqf1=dqf(1);
        V=Vr;
        tb=(qi1-qf1+V*tf)/V;
    else
      qi1=qi(2); qf1=qf(2); dqi1=dqi(2); dqf1=dqf(2);
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
        q(:,i)=qf1-V/(2*tb)*tf^2+V/tb*tf*t-V/(2*tb)*t^2;
        dqi(:,i)=V/tb*tf-V/tb*t;
        ddqi(:,i)=-V/tb;
    end
end
end