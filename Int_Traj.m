function [ Tout_1, Xout, lambda, u_opt] = Int_Traj(x0, tf, t0, lambda_0)

time = linspace(t0, tf, 71);
lambda = lambda_0*exp(time);
i = 1;
u_opt = [];

while i < length(time)
    if lambda(i)*0.5 > 1
        u = -1;
    elseif lambda(i)*0.5 < -1
        u = 1;
    else u = -lambda(i)*0.5;
            
    end
    u_opt(i) = u;
    i = i + 1;
end

[Tout_1, Xout] = ode45(@(t,x) der_x(t, x, u),[t0 tf], x0);

    function  dx = der_x(t, x, u)
        dx = -x + u;
    end

end

