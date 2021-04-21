

 function [pc,u,v,s] = perspective(Ri0,Oe0)


lmbda = 0.5;

p0=[1;0;1];



pc=(Ri0(:,:,2))'*(p0-Oe0);

u = (lmbda*pc(1))/pc(3);
v = (lmbda*pc(2))/pc(3);
s=[u;v]



 end