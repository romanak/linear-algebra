function Q=perminv(P)
%PERMINV
%Inverse of a permutation defined by a matrix A.
%Calling format: B=perminv(A)

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

disp(' ')
format compact
X=size(P);
Q(1,:)=P(1,:);

for i=1:X(1,2),
 Q(2,P(2,i))=P(1,i);
end


