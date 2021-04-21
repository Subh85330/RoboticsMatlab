close all
clear all
clc

th= [0 0]*pi/180;

% Initial image plane co-ordinates when camera is at O_c_0 ie (1,1,0)
[R_2_0,O_c_0,O_2_0] = fkin_p9(th);
lamda=0.5;
P_0 =[1; 0; 1];
[ui,vi,P_c_i] = pers(P_0, O_c_0, R_2_0, lamda);
s=[ui,vi];

% Desired or final image plane co-ordinates when camera is at O_e_0 ie (1,0,0)

thf = [240 120]*pi/180;
[R_2_f,~,O_2_f] = fkin_p9(thf);
O_c_f =[1;0;0];
[ud,vd,~] = pers(P_0, O_c_f, R_2_f, lamda);
sd = [ud;vd];

delta=0.001;
k = 1;
L1=1;
L2=1;
e =inf;
th_i =[0.01;0.01]*pi/180; % Code was not working if we take initial th (0,0)

while norm(e)>delta
    
    [R_2,O_c,O_2] =fkin_p9(th_i);
    [u,v,P_c,z]= pers(P_0,O_c, R_2, lamda);
    s_t =[u;v];
    
    L =  [-lamda/z    0          v;        %Interaction matrix
            0        -lamda/z   -u];
    
    th2 = th_i(2);
    
    J_c =   [L1*sin(th2)        0;
            L1*cos(th2)+L2     L2;
            1                  1];
    
    et = s_t-sd;
    zita =-k*pinv(L)*et;
    dth = pinv(J_c)*zita;
    th_New = th_i + dth*0.01;
    th_i = th_New;
    
    e = et;
    norm(e)
    X = [O_2(1,:)]; 
    Y = [O_2(2,:)];
    X1= [O_2(1,2)  O_c(1)];
    Y1= [O_2(2,2)  O_c(2)];
    
    figure(1)
    plot(X,Y,X1,Y1,O_c_0(1),O_c_0(2),'*',O_c_f(1),O_c_f(2),'o')
    text(O_c_0(1),O_c_0(2),'\leftarrow Initial (1,1,0)')
    text(O_c_f(1),O_c_f(2),'\leftarrow Final (1,0,0)')
    axis([-2 2 -2  2])
    grid on
end
    