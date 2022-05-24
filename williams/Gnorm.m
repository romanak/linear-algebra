function n = gnorm(X,A)
%GNORM 
%The magnitude of a vector X in Rn. 
%Rn has 'inner product' defined by a symmetric matrix A.
%Calling format: gnorm(X,A)

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

n = sqrt(abs((X*A*X')));


