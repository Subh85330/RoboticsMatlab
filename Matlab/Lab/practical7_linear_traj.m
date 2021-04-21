function [q, dqi, ddqi] = practical7_linear_traj(qi,qf,V,t,T,J)


for h=1:length(J)
% i=1;
tb(h) =(qi(h)-qf(h)+V*T)/V;

a_acc(h) = V/tb(h);


    
    if t>=0 & t<=tb
        q(h) = qi(h) + (a_acc(h)/2)*t^2;
        dq(h) = a_acc(h)*t;
        ddq(h) = a_acc(h);
        
    elseif t>tb & t<=(T-tb)
        q(h) = (qf(h) + qi(h) - V*T)/2 + V*t;
        dq(h) = V;
        ddq(h) = 0;
        
    elseif t>(T-tb) & t<=T
        q(h) = qf(h) - (a_acc(h)/2)*(T^2)+a_acc(h)*T*t-(a_acc(h)/2)*t^2;
        dq(h) = a_acc(h)*(T-t);
        ddq(h) = -a_acc(h);
        
    end
    
    
    q=[q(1) q(2)];
    dqi=[dq(1) dq(2)];
    ddqi=[ddq(1) ddq(2)];
    

end




 end
