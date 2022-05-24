function gjdet(P)
%GJDET 
%Determinant using Gauss-Jordan elimination. 
%Option of rational number format. 
%Option of all steps.
%Calling format: gjdet(A)

%Can use given tolerance of 1e-14
%or change to own tolerance
%MATLAB computes to about 16 decimal digits

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

tol=1e-14;
swaps=0;
[n,n]=size(P);
format compact
m=n;%modified GJelim program

disp(' ')
h=input('Rational numbers? y/n: ','s');
g=input('All steps? y/n: ','s');

disp(' ')
disp('initial matrix')
if h=='y' 
  disp(rats(P))
 else 
  disp(P)
end

if g=='y';
 disp('[press Enter at each step to continue]')
 disp(' ')
 pause
end

flag ='T';

%find a pivot
if flag=='T'
 j=1;
 for i=1:n,
  if j <= m
   found=0;
   if abs(P(i, j)) <= tol
     while (found == 0)
         
%search for a leading one and interchange rows if necessary
      for s=i:n,
       if (abs(P(s, j)) > tol) 
		  if  (found == 0)
         found=1;
         if s~=i
          swaps=swaps+1;
          for r=1:m,
           temp=P(i, r);
           P(i, r)=P(s, r);
           P(s, r) = temp;
          end
          if g=='y'; %allsteps
           disp('swap rows')
           if h=='y' 
             disp(rats(P))
            else 
             disp(P)
           end
           disp('--------------------')
           pause
          end %allsteps
         end
        end
       end
      end

      if (found==0) 
       if (j <= n)
        flag='F'; %determinant is zero
        found=1;
       end
      end

      if j>m  
       found=1;   % to exit while loop
      end  
     end %while

     if  j > m
      found = 0;
     end
    else
     found = 1;
   end 

%create zero 
   if flag=='T'
    if found == 1 
    %if (P(i, j) ~= 1) 
    %end
     for r=i+1:n,
      if (abs(P(r, j)) >tol)
       z=P(r, j)/P(i,j);
       for c=j:m, 
        P(r, c)=P(r, c) - z* P(i, c);
       end
       if g=='y'; %allsteps
        disp('create zero')
        if h=='y' 
          disp(rats(P))
         else 
          disp(P)
        end
        disp('--------------------')
        pause
       end %allsteps
      end
     end
    end
   end
   j = j + 1;
  end
 end
end

if g=='y'; 
 disp('-final reduced form-')
 if h=='y' 
   disp(rats(P))
  else 
   disp(P)
 end
 pause
end

%compute prod of diagonal elements
if g=='y';
 disp(' ')
 disp('number of row swaps')
 disp(swaps)
end
d=1;
for tt=1:n,
 d=d*P(tt,tt);
end

disp(' ') 
disp('determinant =')
if h=='y' 
  disp(rats(d*(-1)^swaps))
 else 
    disp(d*(-1)^swaps)
end
 
format loose
disp(' ')
