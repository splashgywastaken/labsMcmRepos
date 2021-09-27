%Вариант 5
%1
z = (3 - 5*1i)^(-1);
disp("z = "+ z);
arg_z = angle(z);
disp("angle z = " + arg_z);

%2
syms f1(x)
f1(x) = (x^5 + x^4 - 8)/(x^3 - 4*x);
disp(f1(x))
F = int(f1,x);
disp(F)

%3

tiledlayout(2,2);

x = -pi:0.01:pi;
f01 = sin(x).*cos(x); 
nexttile;
plot(x, f01,':','Color',[0 0.4470 0.7410],'LineWidth',1.5);
title('asin(1/(x-3)) Шаг 0.01');
grid('on');

x = -pi:0.03:pi;
nexttile;
f03 = sin(x).*cos(x); 
plot(x, f03,'--.','Color',[1 0 1],'LineWidth',1.5);
title('asin(1/(x-3)) Шаг 0.03');
grid('on');
%legend({', 'asin(1/(x-3)) Шаг 0.03'},'Location','southwest')

%4

phi = -pi:0.01:pi;
fpolar = 1 + cos(phi);
nexttile;
polarplot(phi, fpolar, '--','Color',[0.9290 0.6940 0.1250],'LineWidth',1.5);
title('1 + cos(phi)');
grid('on');

%5
X = -pi:0.1:pi;
Y = -pi:0.1:pi;
Z = max(abs(X), abs(Y));
nexttile;
plot3(X,Y,Z);
title('max(|X|,|Y|)');
grid('on');