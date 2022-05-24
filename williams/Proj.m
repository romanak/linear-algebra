function p = proj(X,Y)
%PROJ 
%The projection of vector X onto vector Y.
%Calling format: proj(X,Y)

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

p=((X*Y')/(Y*Y'))*Y;
