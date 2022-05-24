function pow(P)
%POW
%Computes powers of a matrix.
%Option of rational number format.
%Calling format: pow(A)

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

format compact

disp(' ')
h=input('Rational numbers? y/n: ','s');
disp(' ')

disp('matrix')
if h=='y' 
  disp(rats(P)) 
 else 
  disp(P)
end

matrix=P;
disp(' ')
m=input('give power: ');
disp('[press Enter at each step to continue]')
for i=2:m
 disp(' ')
 power = i
 matrix=matrix*P;
 if h=='y' 
   disp(rats(matrix));
  else 
   disp(matrix);
 end
 if i~=m
  pause
 end
end
   
disp(' ')  
format loose




