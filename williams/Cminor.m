function C = cminor(A,m,n)
%CMINOR	
%An utility function to compute a minor. 
%The function is called from other programs. 
%Calling format: cminor(A,m,n)

% Copyright 1992 Lisa Coulter Stetson University.
% email: lcoulter@stetson.edu
% Accompanies "Linear Algebra with Applications" by Gareth Williams

[p,q] = size(A);
if (m > p) | (n > q)
     fprintf('Error: minor requested exceeds matrix bounds\n');
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

   C = det(B);
end




