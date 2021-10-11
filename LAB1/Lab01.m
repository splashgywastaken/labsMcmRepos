%Лабораторная работа номер 1

%Установка кодировки 1251 для матлаба, можно отключить, если долго грузит
if (slCharacterEncoding() ~= 'windows-1251')
    slCharacterEncoding('windows-1251');
end
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
n = 40;
h = (t1-t0)/n;
T = 0 : h : 17;
y_precise = zeros(1, n+1);
%По предложенным формулам найдем точное решение:
C = (r - delta*y0)*exp(r*t0)/(y0*r);
for i = 1:n+1
    y_precise(i) = r / (delta + C*r*exp(-r*T(i)));
end

%Построим график решения
plot(T, y_precise, 'bo-');
xlabel('Дни');
ylabel('клетки брюшной водянки Ehrilch ascites tumour');
set(gca, 'XTickLabel', {0:1:17});

%Получим приблизительное решение задачи методом ломанных Эйлера
y = zeros(1, n+1);
y(1) = y0;

for i = 1:n
    y(i+1) = y(i) + h * y(i) * (r-delta*y(i));
end
abs1 = abs(y_precise - y);
otn1 = abs1./y_precise;
points = 1:(n+1);

Names = {'Time t', 'Exact solution', 'Numerical solution', 'Abs', 'Otn'};
xlswrite('LR01.xls',points','a2:a41');
xlswrite('LR01.xls', Names, 'b1:f1');
xlswrite('LR01.xls', T', 'b2:b41');
xlswrite('LR01.xls', y', 'c2:c41');
xlswrite('LR01.xls', y_precise', 'd2:d41');
xlswrite('LR01.xls', abs1', 'e2:e41');
xlswrite('LR01.xls', otn1', 'f2:f41');
plot(T, y, 'm*-');
hold on;
grid on;
plot(T, y_precise, 'bo-');
xlabel('Дни');
ylabel('клетки брюшной водянки Ehrilch ascites tumour');
set(gca, 'XTickLabel', {0:1:17});
