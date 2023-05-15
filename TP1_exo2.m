clear all
close all
clc

x0 = 0;
t0 = 0;
tf = 2;
time = linspace(t0, tf, 71);

xf = 0.5;
init_guess = 0;

%% Shooting method
opts = optimset('Algorithm', 'trust-region-dogleg');
tir = @(lambda_init) Int_Traj2(x0, tf, t0, lambda_init) - xf;
[lambda_opt,fval,exitflag,output] = fsolve(tir, init_guess, opts);

%% Optimal trajectory
[ Tout_1, Xout, lambda, u_opt] = Int_Traj(x0, tf, t0, lambda_opt);

figure
subplot(1,2,1)
plot(Tout_1, Xout, 'o')
title('State X')

subplot(1,2,2)
plot(time, lambda, 'o')
title('Lambda')

figure
plot(time(1:end-1), u_opt, 'o')
title('Optimal control')

