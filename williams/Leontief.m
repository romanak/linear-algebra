function leontief(P,D)
%LEONTIEF
%Leontief I/O Model.
%I/O matrix A and initial demand vector D 
%Asks for industrial & open sector growth & # years. 
%Gives predictions of ouputs,industrial & domestic demands,
%& exports (to 2 decimal places for ease of reading).
%Option of bar graphs of deficits, for 2 industries.  
%Calling format: leontief(A,D)

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

format bank  %fixed dollars and cents
format compact

disp(' ')
g=input('Percentage growth in industrial production: ');
s=input('Percentage growth in demand of internal open sector: ');
n=input('Give number of years projection: ');
disp(' ')

[m,m]=size(P);
X=inv(eye(m)-P)*D;
Equilib_production=X

disp(' ')
X=input('Give initial production vector X: ');
disp(' ')
X
disp(' ')

format short
for i=1:n
 year=i
 format bank
 disp('      production    ind_demand    dom_demand     net_export')
 disp([X P*X D X-(P*X+D)]) 
 R=X-(P*X+D);
 F(i)=R(1); 
 G(i)=R(2);
 X=X+((g*X)/100);
 D=D+((s*D)/100);
 disp(' ')
 if i~=n
  disp ('**Enter**')
  pause
  disp(' ')
 end
end

if m==2;
 h=input('Bar graphs? y/n: ','s');
 disp(' ')
 if h=='y';
  W=[1:n];
  S=[F G];
  %V is matrix of ranges of x and y
  V=[.5 n+0.5 min(S)-.05*abs(min(S)) max(S)+.05*abs(max(S))];
  axis(V);
  clf
  shg
  subplot(121),bar(W,F)
  title('net exports 1')
  subplot(122),bar(W,G)
  title('net exports 2')
 end
end

format short
format loose
