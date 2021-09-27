function y = swap_rows(y, m, n)
y([m n],:) = y([n m],:);