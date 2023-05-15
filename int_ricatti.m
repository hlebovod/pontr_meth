function [Tout, Yout] = int_ricatti(Pf,t0,tf)


[tout, yout] = ode45(@dyn, [tf t0], Pf);
Tout=tout;
Yout=yout;

    function  dP = dyn(t,P)
        dP=zeros(4,1);
        dP(1) = -4 + 0.5*P(2)*P(3) - P(3) - P(2);
        dP(2) = 0.5*P(2)*P(4) - P(1) + 2*P(2) - P(4);
        dP(3) = 0.5*P(3)*P(4) + 2*P(3) - P(4) - P(1);
        dP(4) = -2 + 0.5*P(4)^2 - P(3) - P(2) + 4*P(4);
    end

end

