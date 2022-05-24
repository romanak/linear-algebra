function P=div(P)
%DIV	
%Divide a row by a matrix by nonzero constant. 
%Used in row reduction.
%Calling format: A=div(A)

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

disp(' ')
r=input('    give row: ');
d=input('give divisor: ');
disp(' ')
P(r,:) = (1/d)*P(r,:);

