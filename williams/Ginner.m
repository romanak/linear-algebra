function p=ginner(X,Y,A)
%GINNER 
%The inner product of two vectors X and Y in Rn. 
%Rn has 'inner product' defined by a symmetric matrix A.
%Calling format: ginner(X,Y,A)

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

p = X*A*Y';

