function minor(A,m,n)
%MINOR
%Gives submatrix and minor of an element of a matrix.
%Calling format: minor(A,m,n), of element (m,n) of A.

% Copyright 1992 Lisa Coulter Stetson University.
% email: lcoulter@stetson.edu
% Accompanies "Linear Algebra with Applications" by Gareth Williams

[p,q] = size(A);
if(m > p) | (n > q)
   fprintf('Error. Minor requested exceeds matrix bounds.\n');
else
   for i = 1:m-1
	for j = 1:n-1
  		B(i,j) = A(i,j);
   	end
	for j = n+1:q
  		B(i,j-1) = A(i,j);
   	end
   end

   for i = m+1:p
 	for j = 1:n-1
  		B(i-1,j) = A(i,j);
 	end
 	for j = n+1:q
  		B(i-1,j-1) = A(i,j);
 	end
   end

   disp(' ')
   disp(' The submatrix is')
   disp(B)
   C = det(B);

   disp('The minor is')
   disp(C)
end



