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