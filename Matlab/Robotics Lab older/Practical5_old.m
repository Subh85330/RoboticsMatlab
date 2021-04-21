clc; clear all;
n=2;
J = [0 1];

m=[0.5 0.5];
l=[0.3 0.3];
dxcom = [0.15 0];
dycom = [0 0];          %distance from Oi-1 to Ci
dzcom = [0 0.15];       %in body fixed frame

Ixx =[0                               1/(12*m(2)*l(2)*l(2))];
Iyy =[1/(12*m(1)*l(1)*l(1))           1/(12*m(2)*l(2)*l(2))]; %in body fixed frame
Izz =[1/(12*m(1)*l(1)*l(1))           0                    ];
Ixy =[0                               0                    ];
Iyz =[0                               0                    ];
Izx =[0                               0                    ];

wim=[0 0 0]'; dwim=[0 0 0]'; ao=[0 0 0]'; ac=[0 0 0]';






a=[0; 0.3];
alp=[0,-90]*pi/180;
d=[0,0.15];
th=[0,0]*pi/180;
qi = [0*pi/180, 0.15];
qf=[120*pi/180, 0.3]+pi/6;
dE6=[0;0;0.3];
T = 10; step=1000;
incr = T/100;
j=0;
for t=0:incr:T
    j = j+1;
    temp=eye(4,4);
    Ri0=eye(3,3);
    % q=qi+((qf-qi)*j/step);
    %Cyclodial Trajestory
    q=qi+((qf-qi)/T)*(t-(T/(2*pi))*(sin(2*pi*t/T)));
    dqi=((qf-qi)/T)*(1-cos(2*pi*t/T));
    ddqi=((qf-qi)/T)*(2*pi/T)*sin(2*pi*t/T);
    
    
    %Forward Recursion
    for i=1:n
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
        Iib=[Ixx(i) Ixy(i) Izx(i)
            Ixx(i) Iyy(i) Izx(i)
            Ixx(i) Ixy(i) Izz(i)];
        Ii=Ri0*Iib*Ri0';
        wi=wim+(1-J(i))*zi*qi(i);
        dwi=dwim + (1-J(i))*(cross(wi,zi*dqi(i))+zi*dqi(i));
        
        
        
        
        temp=Ti0(1:4,1:4,i);
    end
    %Backward Recursion
    % for i=n:-1:1
    Ti0(:,:,n);
    pe0=oi0(1:3,n)+Ti0(1:3,1:3,n)*dE6;
    XX=[oi0(1,:),pe0(1)];
    YY=[oi0(2,:),pe0(2)];
    ZZ=[oi0(3,:),pe0(3)];
    figure(1)
    %  plot3(XX,YY,ZZ);
    %axis([-1.5 1.5 -1.5 1.5 -1.5 1.5])
    
    plot(XX,YY);
    axis([-1 1 -1 1])
    pause(0.1)
end




