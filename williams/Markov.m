function markov(P,X)
%MARKOV
%Markov Chain Model.
%Transition matrix A and initial state column vector X. 
%Gives distributions (to 2 decimal places for ease of reading).
%Option of bar graphs, if two states.
%Calling format: markov(A,X)

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

format compact

disp(' ')
n=input('Give number of steps: ');
h=input('Display all steps? y/n: ','s');

disp(' ')
Q=P;
G(1)=X(1);H(1)=X(2);
for i=2:n+1
 distribution=Q*X;
 if h=='y';
  format short
  step=i-1
  %format bank
  distribution
  if i<=n+1 disp ('**Enter**')
   pause
   disp(' ')
  end
 end
 R=Q*X;
 G(i)=R(1);
 H(i)=R(2);
 Q=Q*P;
end

if h~='y';
 format short
 step=n
 %format bank
 distribution
end

[m,m]=size(P);
if m==2;
 disp(' ')  
 h=input('Bar graphs? y/n: ','s');
 if h=='y';
  W=[1:n+1];
  S=[G H];
  %V is matrix of ranges of x and y
  V=[.5 n+1.5 min(S)-.05*min(S) max(S)+.05*max(S)];
  axis(V);
  clf;hold on
  shg
  subplot(121),bar(W,G)
  title('state 1')
  subplot(122),bar(W,H)
  title('state 2')
 end
 disp(' ')
end

format short
format loose
subplot(111) %full graphics window


