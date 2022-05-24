function A=add(A)
%ADD	
%Add multiple of one row of a matrix to another row.
%Used in row reduction.
%Calling format: A=add(A)
 
%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

disp(' ')
a=input('add the multiple: ');
m=input('          of row: ');
n=input('          to row: ');
A(n,:) = A(n,:) + a*A(m,:);
disp(' ')


