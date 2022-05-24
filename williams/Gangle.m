function u = gangle(X,Y,A)
%GANGLE
%The angle between two vectors X and Y, in degrees, in Rn.
%Rn has inner product defined by a symmetric matrix A.
%Calling format: gangle(X,Y,A)

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

ginner = X*A*Y';
gnormX = sqrt(X*A*X');
gnormY = sqrt(Y*A*Y');
u = acos(ginner/(gnormX*gnormY));
u = u*180/pi;

if (u < 1.0e-10) 
 u = 0;
end

