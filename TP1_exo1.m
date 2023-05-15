clear all
close all
clc

t0=0;
tf=12.5;
X0=[2;1];
A=[0 1 ; 1 -2];
B=[0 ; 1];
Q=[4 0 ; 0 2];
R=2;

Pf=[0 0 0 0]';

[Tout, Pout]=int_ricatti(Pf,t0,tf);
Pin=flipud(Pout);
Tin=flipud(Tout);

figure(1)
plot(Tout,Pout)
grid on;
legend('P1', 'P2', 'P3', 'P4')

sim('simulink_exo1');
figure(2)
plot(xsim)
grid on;
legend('X1', 'X2')

figure(3)
plot(comsim)
grid on;