function lsq
%LSQ
%Sketches a least squares curve for given data.
%Calling format: lsq

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

%Initial values
m=0;n=0;i=1;j=1;f=0;x=[0];y=[0];z=[0];Y=[0];V=[0];c=[0];

disp(' ')
m=input('give degree of polynomial: ');
n=input('    give # of data points: ');
disp(' ')

x(1)=input('  x values of data points: ');
for i=2:n;
 x(i)=input('                         : ');
end
disp(' ')
y(1)=input('  y values of data points: ');
for j=2:n;
 y(j)=input('                         : ');
end

hold off %default graphics window mode
clf %clear graphics window
shg
subplot(111) %full graphics window

%z is matrix of coeff of l.s. curve.
z=polyfit(x,y,m);

%find pts (x,Y) on curve corresp to x data values
for s= 1:n;
 for k= 0:m;
  f=f+z(k+1)*x(s)^(m-k);
 end
 Y(s)=f;f=0;
end

%Compute points on ls curve for plotting the curve,
%in steps of size step
step=(max(x)-min(x))/100;
w=1;

%find least & largest values of y on the graph to 
%have correct window. Start with following values. 
least=min(y);largest=max(y);
for u = min(x):step:max(x);
 G(w)=u;
 for v=0:m;
  f=f+z(v+1)*G(w)^(m-v);
 end
 if f<least
  least=f;
 end
 if f>largest
  largest=f;
 end
 W(w)=f;f=0;w=w+1;
end

%V is matrix of ranges of x and y
marginx=(max(x)-min(x))/10;marginy=(largest-least)/10;
V=[min(x)-marginx max(x)+marginx least-marginy largest+marginy];
axis(V);
plot(x,y,'*',G,W)
title('Least squares curve a+bx+...+cx^n')
%get coeffs in ascending order to fit
%least squares discussion 
for i=1:m+1
 c(i)=z(m-i+2);
end

disp(' ')
disp('coeffs of LS polynomial in ascending powers')
disp(' ')
disp(c)



