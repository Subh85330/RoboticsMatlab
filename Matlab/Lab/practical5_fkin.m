function [Ti0, oi0, z, dc, r, rn w, dw, pe0, ao, ac, mo, f] = practical5_fkin(n, m, J, dxcom, dycom, dzcom, Ixx, Iyy, Izz, Ixy, Iyz, Izx, a, alp, d, th, qi, dEn, q, dqi, ddqi)

wim=[0 0 0]'; dwim=[0 0 0]'; aoim=[0 0 0]'; dcim=[0 0 0]';
temp=eye(4,4);
Ri0=eye(3,3);

for i=1:n
    %% position kinematics
    th(i) = J(i)*th(i)  + (1-J(i))*q(i);
    di(i) = (1-J(i))*d(i) + J(i)*q(i);
    
    Ti=[cos(th(i))             -sin(th(i))               0           a(i)
        sin(th(i))*cos(alp(i))  cos(th(i))*cos(alp(i)) -sin(alp(i)) -d(i)*sin(alp(i))
        sin(th(i))*sin(alp(i))  cos(th(i))*sin(alp(i))  cos(alp(i))  d(i)*cos(alp(i))
        0                       0                        0            1                ];
    
    
    aim1_i =Ri0*Ti(1:3,4);
    Ti0(1:4,1:4,i)=temp*Ti;
    Ri0 = Ti0(1:3,1:3,i);
    zi=Ti0(1:3,3,i);
    oi0(1:3,i)=Ti0(1:3,4,i);
    di=Ri0*[dxcom(i) dycom(i) dzcom(i)]';
    rim=aim1_i-dcim;
    dc(:,i)=di;
    r(:,i)=rim; %r1 = r(:,2) r2=r
    z(:,i)=zi;
    
    %% velocity kinematics
    w(:,i)=wim+(1-J(i))*zi*qi(i);
    
    %% Acceleration
    dw(:,i)=dwim + (1-J(i))*(cross(w(:,i),zi*dqi(i))+zi*dqi(i));
    ao(:,i) = aoim + cross(dwim,aim1_i)+cross(wim,cross(wim,aim1_i))+J(i)*(2*cross(w(:,i),zi*dqi(i)) + zi*ddqi(i));
    
    ac(:,i) = ao(:,i) + cross(dw(:,i),di)+cross(w(:,i),cross(w(:,i),di));
    
    
    
    
    %% inertia forces
    Iib=[Ixx(i) Ixy(i) Izx(i)
        Ixy(i) Iyy(i) Izx(i)
        Izx(i) Iyz(i) Izz(i)];
    Ii=Ri0*Iib*Ri0';
    mo(:,i) = Ii*dw(:,i)+cross(w(:,i),Ii*w(:,i));
    f(:,i)= m(i)*ac(:,i);
    
    
    %% initial for next pass
    wim = w(:,i); dwim = dw(:,i);
    aoim = ao(:,i); acim = ac(:,i);
    
    temp=Ti0(1:4,1:4,i);
    
    
end



%     Ti0(:,:,n);
%Rn0=Ti0(1:3,1:3,n);
pe0=oi0(1:3,n)+Ti0(1:3,1:3,n)*dEn;
rn=Ti0(1:3,1:3,n)*dEn-dc(:,i);
end