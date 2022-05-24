function x = slv(A,b)
% solve Ax=b using L and U obtained from slu(A)

[n,m] = size(A);
if n ~= m
    disp('Not a square matrix!');
    return % return NaN if A is not square matrix
end

[L,U,P] = slu(A);
c = zeros(n,1);
x = zeros(n,1);
b = P * b;

for k = 1:n % forward elimination to solve Lc=b
    s = 0;
    for j = 1:k-1
        s = s + L(k,j) * c(j); % add L times earlier c(j) before c(k)
    end
    c(k) = b(k) - s;
end

for k = n:-1:1 % going backwards from x(n) to x(1)
    t = 0;
    for j = k+1:n % back substitution
        t = t + U(k,j) * x(j); % U times later x(j)
    end
    x(k) = (c(k) - t) / U(k,k); % divide by the pivot
end