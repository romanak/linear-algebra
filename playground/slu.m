function [L,U,P] = slu(A)
% square LU factorization with row exchanges
[n,m] = size(A);
if n ~= m
    disp('Not a square matrix!');
    return % return NaN if A is not square matrix
end

L = zeros(n,n); % lower triangular matrix
U = zeros(n,n); % upper triangular matrix
P = eye(n); % permutation matrix

for k = 1:n
    % look down the current column for the largest pivot and exchange rows
    [~, idx] = max(abs(A(:,k)));
    if idx > k
        % first update permutation matrix for solving x later
        P(idx,idx) = 0;
        P(idx,k) = 1;
        P(k,k) = 0;
        P(k,idx) = 1;
        
        % then swap the rows
        temp = A(k,:);
        A(k,:) = A(idx,:);
        A(idx,:) = temp;
    end
    L(k,k) = 1;
    for i = k+1:n
        L(i,k) = A(i,k) / A(k,k); % multipliers for col k are stored in L
        for j = k+1:n % the value left to the pivot is zero
            A(i,j) = A(i,j) - L(i,k) * A(k,j);
        end
    end
    for j = k:n
        U(k,j) = A(k,j); % store row k of A in U
    end
end