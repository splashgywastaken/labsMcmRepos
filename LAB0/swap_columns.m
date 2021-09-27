function y = swap_columns(y, m, n)
y(:,[m n]) = y(:,[n m]);