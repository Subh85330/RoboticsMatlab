clc
clear
close all
[n, J, m, l, dxcom, dycom, dzcom, Ixx, Iyy, Izz, Ixy, Iyz, Izx, a, alp, d, th, qi, qf, dEn, incr, g, T , t] = practical5_Inputs();
V=0.3;
j=1;

for t=0:incr:T
    
    
    % q=qi+((qf-qi)*j/step);
            [q, dqi, ddqi] = practical7_traj(qi,qf,t,T);
%             [q, dqi, ddqi] = practical7_cubictraj(t);
    %         [q, dqi, ddqi] = practical7_quantictraj(t);
%             [q, dqi, ddqi] = practical7_linear_trajD(J,qi,qf,T,t);
    %         [q, dqi, ddqi] = practical7_linear_traj(qi,qf,V,t,T,J); %wrong
    %Forward Recursion
    [Ti0, oi0, z, dc, r, rn, w, dw, pe0, ao, ac, mo, f] = practical5_fkin(n, m, J, dxcom, dycom, dzcom, Ixx, Iyy, Izz, Ixy, Iyz, Izx, a, alp, d, th, qi, dEn, q, dqi, ddqi);
    
    
    %Backword Recursion
    fiip1=[0;0;0];
    niip1=[0;0;0];
    ri=rn;
    for i=n:-1:1
        fim1i=f(:,i)+fiip1-m(i)*g;
        
        nim1i = mo(:,i) + niip1 + cross(dc(:,i),fim1i)+cross(ri,fiip1);
        ri=r(:,i);
        jf(i,1) = z(:,i)'*((1-J(i))*nim1i + J(i)*fim1i);
    end
    
    
    time(j)=t;
    Jf(:,j)=jf;
    qplot(:,j)=q;
    dqiplot(:,j)=dqi;
    ddqiplot(:,j)=ddqi;
    
    
    %Animation
    figure(1)
    XX=[oi0(1,:),pe0(1)];
    YY=[oi0(2,:),pe0(2)];
    ZZ=[oi0(3,:),pe0(3)];
    figure(1)
    %plot3(XX,YY,ZZ);
    %axis([-1.5 1.5 -1.5 1.5 -1.5 1.5])
    
    plot(XX,YY,'linewidth',2);
    xlabel("X-axis")
    ylabel("Y-axis")
    title("Inverse Dynamics")
    axis([-1.5 1.5 -1.5 1.5])
    pause(0.05)
    j = j+1;
end
figure(2)
plot(time,Jf(1,:),time,Jf(2,:),'k','linewidth',2)
xlabel('time(s)')
ylabel('Joint Forces')
title("Joint Forces vs Time")
legend("Joint1", "joint2")

figure(3)
hold on
plot(time,qplot(1,:),time,qplot(2,:))
legend('thetaRev','dispPre')
xlabel('time(s)')
ylabel('displacement)')
hold off

figure(4)
hold on
plot(time,dqiplot(1,:),time,dqiplot(2,:))
legend('velRev','velPre')
xlabel('time(s)')
ylabel('velocity)')
hold off

figure(5)
hold on
plot(time,ddqiplot(1,:),time,ddqiplot(2,:))
legend('accRev','accPre')
xlabel('time(s)')
ylabel('acceleration')
hold off
