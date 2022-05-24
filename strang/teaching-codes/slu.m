function [L, U] = slu(A)
%SLU LU factorization of a square matrix with no row exchanges.
% [L, U] = slu(A) uses Gaussian elimination to compute a unit 
% lower triangular L and an upper triangular U so that L*U = A.
% The algorithm will stop if a pivot entry is very small.
%
% See also SLV, PLU, LU.

[m, n] = size(A);
if m ~= n || m == 1
    % cannot proceed if A is not a square matrix: stop
    error('Not a square matrix!');
end

L = zeros(n, n); % lower triangular matrix
U = zeros(n, n); % upper triangular matrix

for k = 1:n
   if abs(A(k, k)) < sqrt(eps)
       % cannot proceed without a row exchange: stop
       error(['Small pivot encountered in column ' int2str(k) '.'])
   end
   L(k, k) = 1;
   for i = k+1:n
      L(i,k) = A(i, k) / A(k, k); % multipliers for col k are stored in L
      for j = k+1:n
         A(i, j) = A(i, j) - L(i, k)*A(k, j);
      end
   end
   for j = k:n
      U(k, j) = A(k, j); % store row k of A in U
   end
end