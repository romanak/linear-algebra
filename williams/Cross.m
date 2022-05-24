function C=cross(A,B)
%CROSS	
%Cross product of two vectors.
%The vectors must have 3 elements each.
%Calling format: cross(A,B)

% Copyright 1991 Lisa Coulter. Stetson University.
% enail: lcoulter@stetson.edu
% Accompanies "Linear Algebra with Applications" by Gareth Williams

 C(1) = A(2)*B(3) - A(3)*B(2);
 C(2) = A(3)*B(1) - A(1)*B(3);
 C(3) = A(1)*B(2) - A(2)*B(1);

 disp(C)
