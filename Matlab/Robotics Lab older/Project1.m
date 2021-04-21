close all; clear all;
syms q1 q2 q3 x y z a2 a3 d3 d4
alp=[0 -90 0 -90 90 -90];
% a=[0 0 a2 a3 0 0];
% d=[0 0 d3 d4 0 0];
% DH1=[the1_L the2_L the3_L];
% DH2=[the1_L the2_R the3_R];
% DH3=[the1_R the2_L the3_L];
% DH4=[the1_R the2_R the3_R];
% q=[DH1;DH2;DH3;DH4];
dE=[0;0;1];
% d=d2-d3 "offset"
% d1=0 "offset"
Rz=[cos(q1) -sin(q1) 0;
    sin(q1) cos(q1) 0;
    0 0 1];
Rx=[1 0 0;
    0 cos(q2) -sin(q2);
    0 sin(q2) cos(q2)];
Ry=[cos(q3) 0 sin(q3);
    0 1 0;
    -sin(q3) 0 cos(q3)];
Rzxy= Rz*Rx*Ry
Pe=[x;y;z];
O6=Pe-Rzxy*dE;
xc=O6(1);yc=O6(2);zc=O6(3);
% theta1
the1_L= atan2d(yc,xc)- atan2d(d,sqrt(xc^2+yc^2-d^2));
the1_R=atan2d(yc,xc)+ atan2d(-d,-sqrt(xc^2+yc^2-d^2));
% the1_R=180+the1_L;
s=zc-d1;
u=sqrt(xc^2+yc^2-d^2);
D=(xc^2+yc^2-d^2+s^2-a2^2-a3^2)/(2*a2*a3);
% theta2
the3_L=atand(sqrt(1-D^2)/D);
the3_R=atand(-sqrt(1-D^2)/D);
% theta2
the2_L= atan2d(s,u)-atan2d(a3*sind(the3_L),a2+a3*cosd(the3_L));
the2_R= atan2d(s,u)-atan2d(a3*sind(the3_R),a2+a3*cosd(the3_R));
for j=1:4
    
    Ttemp=eye(3);
    for i=1:3
        T=[cosd(q(j,i)) -sind(q(j,i)) 0;
            sind(q(j,i))*cosd(b(i)) cosd(q(j,i))*cosd(b(i)) -sind(b(i));
            sind(q(j,i))*sind(b(i)) cosd(q(j,i))*sind(b(i)) cosd(b(i))];
        To(:,:,i)=Ttemp*T;
        Ttemp=To(:,:,i);
        %      Qo(1:3,i)=To(1:3,4,i);
    end
    R3(:,:,j)= Ttemp;
    R36(:,:,j)=R3(:,:,j)'*Rzxy;

    if R36(1,3,j)==0&&R36(3,3,j)==0
        the5(j)=0
%         the7(j)=atan2d(-R36(3,1),R36(1,1));
    else
%         for i=1:2
%             if i==1
                the5_L(j)=atan2d(sqrt(1-R36(2,3)^2,R36(2,3)));
                the4_L(j)=atan2d(R36(3,3),-R(1,3));
                the6_L(j)=atan2d(-R36(2,2),R36(2,1));
%             else
                the5_R(j)=atan2d(-sqrt(1-R36(2,3)^2,R36(2,3)));
                the4_R(j)=atan2d(-R36(3,3),R(1,3));
                the6_R(j)=atan2d(R36(2,2),-R36(2,1));
%             end
%         end
    end
end
Sol=[DH1 ]
    