function R=permprod(P,Q)
%PERMPROD
%Product of two permutations defined by matrices A and B.
%Calling format: C=perm(A,B)

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

disp(' ')
format compact
X=size(P);
R(1,:)=P(1,:);

for i=1:X(1,2),
 R(2,i)=P(2,Q(2,i));
end