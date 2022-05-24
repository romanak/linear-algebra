function ginfo
%GINFO
%Computes reduced echelon form of random nx(n+1) matrix. 
%Uses Gaussian elimination. 
%Finds time (in secs), # adds, mults, row swaps. 
%Option of rational number format for matrices. 
%Calling format: ginfo

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

tol=1e-14;
format compact

%h=input('Rational numbers? y/n: ','s');
%q=input('Count of operations? y/n: ','s');
%g=input('All steps? y/n: ','s');
g='n';h='n';q='y';

disp(' ')
disp('   Stats on solving system of n equs in n variables')
disp('            using Gaussian Elimination    ')  
disp(' ')
n=input('Give number of rows in square matrix of coeffs:  ');
m=n+1;
L=0;
P=100*rand(n,m);%create a random nxm augmented matrix
disp(' ')
d=input('Want to display initial and final matrices? y/n: ','s');

if d=='y';
 disp(' ')
 disp('initial augmented matrix')
 disp(P)
end

t1=clock;
j=1;
%find a pivot
j=1;
for i=1:n,
 if j <= m 
  found=0;
  if abs(P(i, j)) <= tol  %end is in line 105
    while (found == 0)
        
%search for a leading one and interchange rows if necessary
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
         swaps = m-j+1;
		   totswaps = totswaps + swaps;
         if g=='y'; %allsteps
          disp('swap rows')
          if h=='y' 
            disp(rats(P))
           else 
            disp(P)
          end
          if q=='y'
           disp('element swaps:')
           disp(swaps)
          end
          disp('--------------------')
          pause
         end 
        end
       end
      end
     end  %search for leading one

     if (found==0) 
      if (j <= m)
       j = j + 1;
      end
     end

     if j>m  
      found=1;
     end 
    end  %of while loop, line 56
    if  j > m
     found = 0;
    end
   else 
    found = 1;
  end  %starts line 55

%normalize leading element in row changing the rest of the row accordingly
  if found == 1
   pivx=i;pivy=j; 
   k=i;
   if (P(k, j) ~= 1) 
    if (abs(P(k, j)) > tol)
     y = P(i, j);
     spotx=k;spoty=j;
     for l=j:m,
      P(k, l) = P(k, l)/y ;
     end
     mults = m-j;
	  totmults = totmults + (m-j);
     if g=='y'; %allsteps
      disp('normalize')
      if h=='y' 
        disp(rats(P))
       else 
        disp(P)
      end
      if q=='y'
       disp('multiplications:')
       disp(mults)
      end
      disp('--------------------')
      pause
     end 
    end
   end
   for r=i:n,
    if (abs(P(r, j)) >tol) 
     if (r ~= i)
      z=P(r, j);
      for c=j:m, 
       P(r, c)=P(r, c) - z * P(i, c);
      end
      adds = m-j;
      mults = m-j;
      totadds = totadds + adds;
      totmults = totmults + mults;
      if g=='y'; %allsteps
       disp('create zero')
       if h=='y' 
         disp(rats(P))
        else 
         disp(P)
       end
       if q=='y'
        disp('additions, multiplications:')
        ops=[adds mults];
        disp(ops)
       end
       disp('--------------------')
       pause
      end 
     end
    end
   end
  end

 j = j + 1;

 end
end

%print echelon form
%delete this part since would take up time making the
%time measurement incorrect.

for rfor=1:pivx, 
 rback=pivx-rfor+1;
 col=1;
  while P(rback,col)==0
   col=col+1;
  end     
  for r=1:rback-1,
   z=P(r,col);   
   for c=1:m, 
    P(r, c)=P(r, c) - z * P(rback, c);
   end
   adds = m-col-(rfor-1);
   mults = m-col-(rfor-1);
   totadds = totadds + adds;
   totmults = totmults + mults;
   if g=='y'; %allsteps
    disp('create zero')
    if h=='y' 
      disp(rats(P))
     else 
      disp(P)
    end
    if q=='y'
     disp('additions, multiplications:')
     ops=[adds mults];
     disp(ops)
    end
    disp('--------------------')
    pause
   end 
  end
 end
 
t2=clock;
 
if d=='y';
 disp(' ')
 disp('-reduced echelon form-')
 disp(P)
 disp(' ')
end

disp(' ')

additions=totadds
multiplications=totmults
%element-swaps=totswaps
time=etime(t2,t1)
disp('    seconds')

disp(' ')
format loose

