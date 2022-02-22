%Лабораторная работа номер 1
%Вариант 5
clear;
clc;

%Условие задачи
K = 150*10^7;
r = 0.6;
y0 = 4*10^7;
t0 = 0;
t1 = 17;

delta = r/K;

%Для задания точного решения создадим массив из нулей и массив, хранящий
%временные отрезки
n = 50;
h = (t1-t0)/n;
T = 0 : h : 17;


%%%%%%%%%%%%%%%%%%Задание 1
y_precise = zeros(1, n+1);
%По предложенным формулам найдем точное решение:
C = (r - delta*y0)*exp(r*t0)/(y0*r);
for i = 1:n+1
    y_precise(i) = r / (delta + C*r*exp(-r*T(i)));
end

%Получим приблизительное решение задачи методом ломанных Эйлера
y = zeros(1, n+1);
y(1) = y0;

for i = 1:n
    y(i+1) = y(i) + h * y(i) * (r-delta*y(i));
end
abs1 = abs(y_precise - y);
otn1 = abs1./y_precise;
points = 1:(n+1);

%Запись данных в xls файл
Names = {'Time t', 'Exact solution', 'Numerical solution', 'Abs', 'Otn'};
xlswrite('LR01_1.xls',points','a2:a41');
xlswrite('LR01_1.xls', Names, 'b1:f1');
xlswrite('LR01_1.xls', T', 'b2:b41');
xlswrite('LR01_1.xls', y', 'c2:c41');
xlswrite('LR01_1.xls', y_precise', 'd2:d41');
xlswrite('LR01_1.xls', abs1', 'e2:e41');
xlswrite('LR01_1.xls', otn1', 'f2:f41');

%Отрисовка графиков
figure;
plot(T, y, 'm*-');
title('Задание 1');
hold on;
grid on;
plot(T, y_precise, 'bo-');
xlabel('Дни');
ylabel('клетки брюшной водянки Ehrilch ascites tumour');
set(gca, 'XTickLabel', {0:1:17});
hold off;

%%%%%%%%%%%%%%%%%%%Задание 2

%Для задания точного решения создадим массив из нулей и массив, хранящий
%временные отрезки
n = 50;
h = (t1-t0)/n;
T = 0 : h : 17;

y_precise = zeros(1, n+1);
%y0 = 0;

%По предложенным формулам найдем точное решение:
C = 1 / y0 + r * t0;
for i = 1:n+1
    y_precise(i) = 1 / ( C - r * T (i) );
end

for i=1:n
    y(i+1)=y(i)+h*r*y(i)^2;
end

abs1 = abs(y_precise - y);
otn1 = abs1./y_precise;
points = 1:(n+1);

%Запись данных в xls файл
Names = {'Time t', 'Exact solution', 'Numerical solution', 'Abs', 'Otn'};
xlswrite('LR01_2.xls',points','a2:a41');
xlswrite('LR01_2.xls', Names, 'b1:f1');
xlswrite('LR01_2.xls', T', 'b2:b41');
xlswrite('LR01_2.xls', y', 'c2:c41');
xlswrite('LR01_2.xls', y_precise', 'd2:d41');
xlswrite('LR01_2.xls', abs1', 'e2:e41');
xlswrite('LR01_2.xls', otn1', 'f2:f41');

%Отрисовка графиков
figure;
plot(T, y, 'm*-');
title('Задание 2');
hold on;
grid on;
plot(T, y_precise, 'bo-');
xlabel('Дни');
ylabel('клетки брюшной водянки Ehrilch ascites tumour');
set(gca, 'XTickLabel', {0:1:17});
hold off;

%%%%%%%%%%%%%%%%%%%Задание 3
%Для задания точного решения создадим массив из нулей и массив, хранящий
%временные отрезки
n = 50;
h = (t1-t0)/n;
T = 0 : h : 17;

y_precise = zeros(1, n+1);
y = zeros(1, n+1);
%y0 = 10;
tau = 1;
a = 1;
b = 3;

%По предложенным формулам найдем точное решение:
C = tau * log( y0 ) - b / y0 - a * b * t0;
for i = 1:n+1
    y_precise(i) = b / ( tau * lambertw(0, ( b * exp(-(C + a*b*T(i))/tau) ) / tau) );
end

%Получим приблизительное решение задачи
y = zeros(1, n+1);
y(1) = y0;

for i = 1:n
    y(i+1) = y(i)+ h * a * b * y(i).^2 / ( b + tau * y(i) );
end

abs1 = abs(y_precise - y);
otn1 = abs1./y_precise;
points = 1:(n+1);

%Запись данных в xls файл
Names = {'Time t', 'Exact solution', 'Numerical solution', 'Abs', 'Otn'};
xlswrite('LR01_3.xls',points','a2:a41');
xlswrite('LR01_3.xls', Names, 'b1:f1');
xlswrite('LR01_3.xls', T', 'b2:b41');
xlswrite('LR01_3.xls', y', 'c2:c41');
xlswrite('LR01_3.xls', y_precise', 'd2:d41');
xlswrite('LR01_3.xls', abs1', 'e2:e41');
xlswrite('LR01_3.xls', otn1', 'f2:f41');

%Отрисовка графиков
figure;
plot(T, y, 'm*-');
title('Задание 3');
hold on;
grid on;
plot(T, y_precise, 'bo-');
xlabel('Дни');
ylabel('клетки брюшной водянки Ehrilch ascites tumour');
set(gca, 'XTickLabel', {0:1:17});
hold off;

%%%%%%%%%%%%%%%%%%%%Задание 4

%Для задания точного решения создадим массив из нулей и массив, хранящий
%временные отрезки
n = 50;
h = (t1-t0)/n;
T = 0 : h : 17;

y_precise = zeros(1, n+1);
y = zeros(1, n+1);
%y0 = 10;
d = 0.7;

%По предложенным формулам найдем точное решение:
for i = 1:n+1
    y_precise(i) = ( b * d ) / ( a * b - d * tau );
end 

%Получим приблизительное решение задачи
y = zeros(1, n+1);
y(1) = y0;

for i = 1:n
    y(i+1) = y(i) + h * a * b * y(i).^2 / ( b + tau * y(i) ) - d * h * y(i);
end

abs1 = abs(y_precise - y);
otn1 = abs1./y_precise;
points = 1:(n+1);

%Запись данных в xls файл
Names = {'Time t', 'Exact solution', 'Numerical solution', 'Abs', 'Otn'};
xlswrite('LR01_4.xls',points','a2:a41');
xlswrite('LR01_4.xls', Names, 'b1:f1');
xlswrite('LR01_4.xls', T', 'b2:b41');
xlswrite('LR01_4.xls', y', 'c2:c41');
xlswrite('LR01_4.xls', y_precise', 'd2:d41');
xlswrite('LR01_4.xls', abs1', 'e2:e41');
xlswrite('LR01_4.xls', otn1', 'f2:f41');

%Отрисовка графиков
figure;
plot(T, y, 'm*-');
title('Задание 4');
hold on;
grid on;
plot(T, y_precise, 'bo-');
xlabel('Дни');
ylabel('клетки брюшной водянки Ehrilch ascites tumour');
set(gca, 'XTickLabel', {0:1:17});
hold off;

%%%%%%%%%%%%%%%%%%%%Задание 5

%Для задания точного решения создадим массив из нулей и массив, хранящий
%временные отрезки
n = 50;
h = (t1-t0)/n;
T = 0 : h : 17;

y_precise = zeros(1, n+1);
%y0 = 10;

%По предложенным формулам найдем точное решение:
for i = 1:n+1
    y_precise(i) = 2 * lambertw( 0, exp( 1 / 2 - 2 * T(i)) / 2);
end

%Получим приблизительное решение задачи
y = zeros(1, n+1);
y(1) = y0;

for i = 1:n
    y(i+1) = y(i) + h*a*b * y(i).^2 / ( b+tau*y(i) ) - d*y(i) - delta * y(i).^2;
end

abs1 = abs(y_precise - y);
otn1 = abs1./y_precise;
points = 1:(n+1);

%Запись данных в xls файл
Names = {'Time t', 'Exact solution', 'Numerical solution', 'Abs', 'Otn'};
xlswrite('LR01_5.xls',points','a2:a41');
xlswrite('LR01_5.xls', Names, 'b1:f1');
xlswrite('LR01_5.xls', T', 'b2:b41');
xlswrite('LR01_5.xls', y', 'c2:c41');
xlswrite('LR01_5.xls', y_precise', 'd2:d41');
xlswrite('LR01_5.xls', abs1', 'e2:e41');
xlswrite('LR01_5.xls', otn1', 'f2:f41');

%Отрисовка графиков
figure;
plot(T, y, 'm*-');
title('Задание 5');
hold on;
grid on;
plot(T, y_precise, 'bo-');
xlabel('Дни');
ylabel('клетки брюшной водянки Ehrilch ascites tumour');
set(gca, 'XTickLabel', {0:1:17});
hold off;