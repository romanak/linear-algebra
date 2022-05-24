function B = adj(A)
%ADJ	
% The adjoint of a matrix A.
% Calling format: B = adj(A)

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

[m,n] = size(A);

for i = 1:n
 for j = 1:m
  k = i+j;
  sign = (-1)^k;
  B(i,j) = sign*cminor(A,i,j);
 end
end

B = B';