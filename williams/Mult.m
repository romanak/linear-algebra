function P=mult(P)
%MULT 
%Mutiply a row by a matrix by a constant. 
%Used in row reduction.
%Calling format A=mult(A)

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

disp(' ')
r=input('       give row: ');
m=input('give multiplier: ');
disp(' ')
P(r,:) = m*P(r,:);
