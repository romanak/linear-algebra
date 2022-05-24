function d = dist(X,Y)
%DIST	
%Distance between points X and Y in Rn.
%Calling format: dist(X,Y)

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

Z=X-Y;
d=sqrt(Z*Z');


