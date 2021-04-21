function [q, dqi, ddqi] = practical7_traj(qi,qf,t,T)
q=qi+((qf-qi)/T)*(t-(T/(2*pi))*(sin(2*pi*t/T)));
dqi=((qf-qi)/T)*(1-cos(2*pi*t/T));
ddqi=((qf-qi)/T)*(2*pi/T)*sin(2*pi*t/T);
    
end