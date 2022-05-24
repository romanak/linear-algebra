function P=swap(P)
%SWAP
%Swap two rows of matrix.
%Used in row reduction.
%Calling format: A=swap(A)

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

disp(' ')
m=input('swap row: ');
n=input(' and row: ');
Q=P;
P(m,:) = Q(n,:);
P(n,:) = Q(m,:);
