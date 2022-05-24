function d = gdist(X,Y,A)
%GDIST	
%The distance between points X and Y in Rn. 
%Rn has inner product defined by a symmetric matrix A.
%Calling format: gdist(X,Y,A)

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

Z=X-Y;
d=sqrt(abs((Z*A*Z')));
