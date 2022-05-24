function gjalg
%GJALG 
%Gauss-Jordan algorithm for a random nxm matrix.
%Gives all the steps in Gauss-Jordan elimination.
%Output is with 1's, 0's and *'s showing
%the general pattern of the algorithm.
%Calling format: gjalg

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

disp(' ')
n=input('Number of rows in matrix:  ');
m=input('Number of columns       :  ');
mm=4*m;
P=100*rand(n,m);%create a random nxm augmented matrix
tol=1e-14;
format compact


%h=input('Rational numbers? y/n: ','s');
%q=input('Count of operations? y/n: ','s');
%g=input('All steps? y/n: ','s');
g='y';h='n';q='n';

disp(' ')
disp('initial matrix')
if h=='y' 
  disp(rat(P,'s'))
 else 
  disp(P)
end

disp(' ')
disp('-Gauss/Jordan Algorithm-')

for ar=1:n
 for ac=1:mm
  if (4*round(ac/4)==ac)
    Q(ar,ac)='*';
   else
    Q(ar,ac)=' ';
  end
 end
end

for row=1:n
 if (abs(P(row,1)) <= tol)
  Q(row,4)='0';
 end
 if (abs(P(row,1)-1) <= tol)
  Q(row,4)='1';
 end
end

disp('')
disp(Q)

if g=='y';
 disp('[press Enter at each step to continue]')
 disp(' ')
 pause
end

%find a pivot
j=1;
for i=1:n,
 if j <= m
  found=0;
  if abs(P(i, j)) <= tol
   Q(i,4*j)='0';
   while (found == 0)
%search for a leading one and interchange rows if necessary
    for s=i:n,
     if (abs(P(s, j)) > tol) 
		if  (found == 0)
       found=1;
       if s~=i
        for r=j:m,
         temp=P(i, r);
         temp2=Q(i, 4*r);
         P(i, r)=P(s, r);
         Q(i, 4*r)=Q(s, 4*r);
         P(s, r) = temp;
         Q(s, 4*r) = temp2;
         Q(s,4*j)='0';
        end
        swaps = m-j+1;
		  totswaps = totswaps + swaps;
        if g=='y'; %allsteps
         disp('swap rows')
         if h=='y' 
           disp(rat(P,'s'))
          else 
           isp(Q)
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
    end

    if (found==0) 
     if (j <= m)
      for row=s:n
       Q(row,4*(j))='0';
      end
      j = j + 1;
     end
    end

    if j>m  
     found=1;   % to exit while loop
    end 
    end  
    if  j > m
     found = 0;
    end
   else
   found = 1;
  end  

%normalize leading element in row changing the rest of the row accordingly
  if found == 1 
   k=i;
   if (abs((P(k, j)-1))<=tol)
    Q(k,4*j)='1';
   end
   if (P(k, j) ~= 1) 
    if (abs(P(k, j)) > tol)
     y = P(i, j);
     for l=j:m,
      P(k, l) = P(k, l)/y ;
     end
     mults = m-j;
	  totmults = totmults + mults;
     if g=='y'; %allsteps
      disp('normalize')
      Q(i,4*j)='1';
      if h=='y' 
        disp(rat(P,'s'))
       else 
        disp(Q)
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

   for r=1:n,
    if (abs(P(r,j)) <=tol)
     Q(r,4*j)='0';
    end
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
       Q(r,4*j)='0';
       if h=='y' 
         disp(rat(P,'s'))
        else 
         disp(Q)
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
%end i loop


%print out final matrix
disp('-reduced echelon form-')

if h=='y' 
  disp(rat(P,'s'))
 else 
  disp(P)
end

if q=='y'
 disp('Total additions, multiplications, element-swaps:')
 disp(ops)
 disp('--------------------')
end

disp(' ')

format loose
