function x = slv(A, b)
% SLV Solve the linear equation A*x = b
% x = slv(A, b) tries to use the LU factorization computed
% by slu(A) to solve the linear equation A*x = b.
% Since slu does not exchange rows, SLV may fail if a 
% small pivot is encountered.
%
% See also SLU, SOLVE, PARTIC.

[n, ~] = size(A);
[m, ~] = size(b);
if m ~= n || m == 1
    % cannot proceed if the number of rows of A and b do not match: stop
    error('A does not match with b!');
end
[L, U] = slu(A);

% forward elimination to solve L*c = b
% L is lower triangular with 1's on the diagonal.

c = zeros(n, 1);
for k = 1:n
   s = 0;
   for j = 1:k-1
      s = s + L(k, j)*c(j);
   end
   c(k) = b(k) - s;
end

% back substitution to solve U*x = c
% U is upper triangular with nonzeros on the diagonal

x = zeros(n, 1);
for k = n:-1:1
   t = 0;
   for j = k+1:n
      t = t + U(k, j)*x(j);
   end
   x(k) = (c(k) - t) / U(k, k); % divide by pivot
end