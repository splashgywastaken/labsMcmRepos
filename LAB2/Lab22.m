clear
clc

syms I theta(t) b g m r;
eqn = 0 == I*diff(theta,2)+b*diff(theta)+g*m*r*sin(theta);
eqn = subs(eqn,I,m*r);
%eqn = isolate(eqn,diff(theta,2));
syms x;
approx = taylor(sin(x),x,'Order',2);
approx = subs(approx,x,theta(t));
eqn1 = subs(eqn,sin(theta(t)),approx);

%Решаем уравнение eqnSolve
syms theta_0 theta_t0;
theta_t = diff(theta);
cond = [theta(0) == theta_0, theta_t(0) == theta_t0];
thetaSol(t) = dsolve(eqn1,cond);


%Находим период колебаний
gValue = 9.81;
rValue = 3.5;
omega_0Value = sqrt(gValue/rValue);
T = 2*pi/omega_0Value;
theta_0Value = 0.1*pi;%Значения варианта 
theta_t0Value = pi/4; %
mValue = 1;
bValue = 0.6; %0.05 0.1 0.4
vars = [g b m r theta_0 theta_t0];
values = [gValue bValue mValue rValue theta_0Value theta_t0Value];
thetaSolPlot = subs(thetaSol,vars,values);


%График
fplot(thetaSolPlot(t*T)/pi, [0 5]);
grid on;
title('Гармоническое движение маятника');
xlabel('t/T');
ylabel('\theta/\pi');


%Анимация
figure
x_pos = sin(thetaSolPlot);
y_pos = -cos(thetaSolPlot);
fanimator(@fplot,x_pos,y_pos,'ko','MarkerFaceColor','k','AnimationRange',[0 5*T]);
hold on;
fanimator(@(t) plot([0 x_pos(t)],[0 y_pos(t)],'k-'),'AnimationRange',[0 5*T]);
fanimator(@(t) text(-0.3,0.3,"Таймер: "+num2str(t,2)+" с"),'AnimationRange',[0 5*T]);
playAnimation