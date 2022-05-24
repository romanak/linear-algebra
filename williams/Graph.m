function graph
%GRAPH
%Graphs a polynomial using given step size.
%Choice of:
% automatic computation of range,
% computation of absolute max,min for given steps.
%Calling format: graph

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

disp(' ')

n=0;i=0;d=0;e=0;x=0;X=[0];Y=[0];V=[0];%Initial values
n=input('     give degree of polynomial: ');
a(n)=input('enter coeffs of x^n, x^n-1 etc: ');

for i=1:n-1;
 a(n-i)=input('                              : ');
end

ao=input('                              : ');
%domain
d=input('                  domain, x = : ');
e=input('                           to : ');
r=input('auto computation of range? y/n: ','s');

if r=='n';
 dd=input('                   range, y = : ');
 ee=input('                           to : ');
end

step=input('        step size in graphing : ');
g=input('want max and min? y/n: ','s');
disp(' ')
disp('**computing pts for graphing**')

%Compute points on ls curve for plotting the curve,
%in steps of size 'step', 
f=ao;m=1;
for x = d:step:e;
 X(m)=x;
 for v=0:n-1;
  f=f+a(n-v)*x^(n-v);
 end
 Y(m)=f;f=ao;m=m+1;
end

%Compute domain and range for graphing
if r=='y';V=[min(X) max(X) min(Y) max(Y)];end
if r=='n';V=[d e dd ee];end
axis(V);
hold on

%Plot points and join them up
clf
shg
plot(X,Y)
title('polynomial ax^n +...+bx+c')

if g=='y';
 %Compute max & min. Use tolerance of 10*eps.
 %eps = 2^-52 = 2.22^10-16
 disp(' ')

 for i=1:m-1,
  if Y(i)<=(min(Y)+eps),
   if Y(i)>=(min(Y)-eps),
    minat=X(i);
    miny=min(Y);
    minimum=[minat miny]
   end
  end
 end
 for j=1:m-1,
  if Y(j)<=(max(Y)+eps) 
   if Y(j)>=(max(Y)-eps),
    maxat=X(j);
    maxy=max(Y);
    maximum=[maxat maxy]
   end
  end
 end
else
   disp(' ')
end






