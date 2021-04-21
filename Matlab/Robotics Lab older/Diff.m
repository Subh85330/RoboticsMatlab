function dy=Diff(t,y)

%input data
m=1; l=1; lc=0.5; Izz=(m*l^2)/3; g=9.81; tou=0;

y1=y(1);
y2=y(2);

dy1=y2;
dy2=-(m*g*lc*cos(y1)/Izz)+tou/Izz;

dy=[dy1; dy2]
end