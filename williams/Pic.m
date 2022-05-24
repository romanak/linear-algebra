function pic(P,w)
%PIC
%subroutine for drawing graphs in GJpic and Gausspic.
%Calling format: pic(A,w)

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

hold off %default graphics window mode
X=[];Y=[]; %Initial values of X and Y, empty matrices.
S=size(P);

%construct all the 2x3 submatrices Q in P 
%each 2x3 matrix Q corresponds to 2 lines
%rref of Qs gives pts of int of lines
%store these points in X and Y
for i=1:S(1,1)-1
 for j=i+1:S(1,1)
  Q=[P(i,1) P(i,2) P(i,3);P(j,1) P(j,2) P(j,3)]; 
  R=rref(Q);
  X=[X R(1,3)];
  Y=[Y R(2,3)];
 end
end

%Use G and W to compute the axes
G=[X 0];
W=[Y 0];

%compute & plot axes
V=[min(G)-1 max(G)+1 min(W)-1 max(W)+1];
axis(V);
A1=[min(G)-1 max(G)+1];
B1=[0 0];
C1=[min(W)-1 max(W)+1];

if w==1;
  subplot(221)
 elseif w==2;
  subplot(222)
 elseif w==3;
  subplot(223)
 else
  subplot(224)
end

plot(A1,B1,':')
hold on
plot(B1,C1,':')
hold on
%X=[X X(1)];Y=[Y Y(1)];
%plot the lines corresp to rows of P
for i=1:S(1,1)
 if P(i,2)~=0
  X1=[min(G)-1 max(G)+1];
  Y1=[(P(i,3)-P(i,1)*(min(G)-1))/P(i,2) (P(i,3)-P(i,1)*(max(G)+1))/P(i,2) ];
 end 
 if P(i,2)==0
  if P(i,1)~=0
   X1=[P(i,3)/P(i,1) P(i,3)/P(i,1)];
   Y1=[min(W)-1 max(W)+1];
  end
 end
 plot(X1,Y1)
end

hold off



