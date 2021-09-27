function A = detCheck(A)
if det(A) == 0
    for i = 1:3
        for j = 1:3
            if A(i,j) == 0
                A(i,j) = 1;
                return
            end
        end
    end
end

