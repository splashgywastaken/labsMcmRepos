%Вариант 5
clear
clc


syms m a g theta(t);
eqn = m*a == -m*g*sin(theta);
syms r;
eqn = subs(eqn,a,r*diff(theta,2)); 
eqn = isolate(eqn,diff(theta,2));
syms omega_0;
eqn = subs(eqn,g/r,omega_0^2); 
syms x;
approx = taylor(sin(x),x,'Order',2);
approx = subs(approx,x,theta(t));
eqnLinear = subs(eqn,sin(theta(t)),approx);


%Решаем уравнение eqnSolve
syms theta_0 theta_t0;
theta_t = diff(theta);
cond = [theta(0) == theta_0, theta_t(0) == theta_t0]; %Задаем начальные условия
assume(omega_0,'real'); %Предполагаем, что omega_0 это действительное число
thetaSol(t) = dsolve(eqnLinear,cond); %Решение


%Находим период колебаний
gValue = 9.81;
rValue = 3.5;
omega_0Value = sqrt(gValue/rValue);
T = 2*pi/omega_0Value; %Период
theta_0Value = 0.1*pi;%Значения варианта
theta_t0Value = pi/4; %
vars = [omega_0 theta_0 theta_t0];
values = [omega_0Value theta_0Value theta_t0Value];
thetaSolPlot = subs(thetaSol,vars,values); %Численное решение


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