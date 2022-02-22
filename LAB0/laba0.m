clc
clear
%Задание 1:
%1
A = zeros(3);
for i = 1:3
    for j = 1:3
        A(i,j) = i + 2*j - 1;
    end
end
A1 = A;
%2
ONE = ones(3);
Z = zeros(3);
%3
E = eye(3);
%4
A2 = A;
A2(1,:) = [];
A3 = A;
A3(:,3) = [];
%5
A4 = A;
A4(:,4) = [ 7 8 9 ];
%6
B = A.';
%7
disp("A + B = ");
disp(A+B);
disp("A - B = ");
disp(A-B);
disp("A + ONE = ");
disp(A+B);
disp("A - ONE = ");
disp(A-ONE);
disp("B + Z = ");
disp(B + Z);
disp("B - Z = ");
disp(B - Z);
disp("B + 2*A = ");
disp(B + 2*A);
disp("3*B = ");
disp(3*B);
%8
disp("A.*B = ");
disp(A.*B);
disp("A./B = ");
disp(A./B);
disp("A.^2 = ");
disp(A.^2);
%9
disp("A*B = ");
disp(A*B);
disp("B*E = ");
disp(B*E);
disp("A*E = ");
disp(A*E);
disp("A*ONE = ");
disp(A*ONE);
%10
a = A(1,:);
b = A(3,:);
c = A(:,2);
d = A(:,2);
%11
disp("A = ")
disp(A);
disp("A (rows swapped) = ")
A = swap_rows(A, 1, 2);
disp(A);
disp("A (columns swapped) = ")
A = swap_columns(A, 1, 3);
disp(A);
%12
d_12 = ones(1,3);
sled = 0;
for i = 1:3
    d(i) = A(i,i);
    sled = sled + d(i);
end
%13
A_det = det(A);
B_det = det(B);
E_det = det(E);
ONE_det = det(ONE);
%14
A_rank = rank(A);
%15
A(2,3) = 12;
%16
detCheck(A);
AI = inv(A);
%17
disp("AI*A");
disp(AI*A);
%18
A_vosst = (eye(3) / AI);
disp("A = ")
disp(A)
disp("restored A = ")
disp(A_vosst)

clc
clear
%Задание 2:
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
[X,Y] = meshgrid(-pi:0.1:pi, -pi:0.1:pi);
Z = max(abs(X), abs(Y));
nexttile;
surf(X,Y,Z);
title('max(|X|,|Y|)');
grid('on');