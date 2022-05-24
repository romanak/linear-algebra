function U = tdot(A,B,C)
%TDOT 
%Triple scalar product of three vectors.
%The vectors must all have 3 elements.
%Calling format: tdot(A,B,C) 

% Copyright 1991 Lisa Coulter. Stetson University.
% email: lcoulter@stetson.edu
% Accompanies "Linear Algebra with Applications" by Gareth Williams

x = zeros(3,3);
x(1,1) = A(1);
x(1,2) = A(2);
x(1,3) = A(3);
x(2,1) = B(1);
x(2,2) = B(2);
x(2,3) = B(3);
x(3,1) = C(1);
x(3,2) = C(2);
x(3,3) = C(3);
U = abs(det(x));
