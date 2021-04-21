function [u,v,P_c,z] = pers(P_0, O_c_0, R_2_0, lamda)

P_c = R_2_0' *(P_0 - O_c_0);

x=P_c(1);
y=P_c(2);
z=P_c(3);

u=lamda*(x/z);
v=lamda*(y/z);

end