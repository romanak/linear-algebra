function gjinfo
%GJINFO 
%Computes reduced echelon form of random nx(n+1) matrix.
%Uses Gauss Jordan elimination.
%Finds time (in secs), # adds and mults. 
%Option of rational number format for matrices
%Calling format: gjinfo

%Can use given tolerance of 1e-14
%or change to own tolerance
%MATLAB computes to about 16 decimal digits

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

%direct modification of Gjelim

%Initial values
adds=0;totadds=0;mults=0;totmults=0;swaps=0;totswaps=0;
ops=[0];

format compact
tol=1e-14;

disp(' ')
disp('   Stats on solving system of n equs in n variables')
disp('          using Gauss/Jordan Elimination    ')  
disp(' ')
n=input('Give number of rows in square matrix of coeffs:  ');
m=n+1;
L=0;
P=100*rand(n,m);%create a random nxm augmented matrix
disp(' ')
g=input('Want to display initial and final matrices? y/n: ','s');

if g=='y';
 disp(' ')
 disp('initial augmented matrix')
 disp(P)
end

t1=clock;
j=1;
for i=1:n,
 if j <= m
  found=0;
  if abs(P(i, j)) <= tol  %end in line 67
    while (found == 0)  
     for s=i:n,
      if (abs(P(s, j)) > tol) 
		 if  (found == 0)
        found=1;
        if s~=i
         for r=1:m,
          temp=P(i, r);
          P(i, r)=P(s, r);
          P(s, r) = temp;
         end
        end
       end
      end
     end
     if (found==0) 
      if (j <= m)
       j = j + 1;
      end
     end
     if j>m  
      found=1; 
     end 
    end 
    if  j > m
     found = 0;
    end
   else 
   found = 1;
  end  %starts line 37  
  
  %normalize
  if found == 1 
   k=i;
   if (P(k, j) ~= 1) 
    if (abs(P(k, j)) > tol)
     y = P(i, j);
     for l=j:m,
      P(k, l) = P(k, l)/y ;
     end
    end
   end
   for r=1:n,
    if (abs(P(r, j)) >tol) 
     if (r ~= i)
      z=P(r, j);
      for c=j:m, 
       P(r, c)=P(r, c) - z * P(i, c);
      end
     end
    end
   end
  end
  j = j + 1;
 end
end
   
t2=clock;

if g=='y';
 disp(' ')
 disp('-reduced echelon form-')
 disp(P)
 disp(' ')
end

disp(' ')

additions=n^3/2-n/2
multiplications=n^3/2+n^2/2
time=etime(t2,t1)
disp('    seconds')
disp(' ')
format loose

