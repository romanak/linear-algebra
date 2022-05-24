function gjinv(Q)
%GJINV
%Matrix inverse using Gauss-Jordan elimination.
%Option of rational number format. 
%Option of all steps.
%Calling format: gjinv(A)

%Can use given tolerance of 1e-14
%or change to own tolerance
%MATLAB computes to about 16 decimal digits

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

tol=1e-14;
[n,n]=size(Q);
P=[Q eye(n)];
[n,m]=size(P);
format compact

disp(' ')
h=input('Rational numbers? y/n: ','s');
g=input('All steps? y/n: ','s');

disp(' ')
disp('initial matrix')
if h=='y' 
  disp(rats(Q))
 else 
  disp(Q)
end

disp(' ')

if g=='y'
 disp('initial extended matrix')
 if h=='y' 
   disp(rats(P))
  else 
   disp(P)
 end
end

if g=='y';
 disp('[press Enter at each step to continue]')
 disp(' ')
 pause
end

flag='T';

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
        flag='F'; %inverse does not exist
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

%normalize leading element in row changing the rest of the row accordingly
   if flag=='T'
    if found == 1 
     k=i;
     if (P(k, j) ~= 1) 
      if (abs(P(k, j)) > tol)
       y = P(i, j);
       for l=j:m,
        P(k, l) = P(k, l)/y ;
       end
       if g=='y'; %allsteps
        disp('normalize')
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
     for r=1:n,
      if (abs(P(r, j)) >tol) 
       if (r ~= i)
        z=P(r, j);
        for c=j:m, 
         P(r, c)=P(r, c) - z * P(i, c);
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

 end %if flag 'T'

 if g=='y'; %print out red ech form if allsteps
  disp('final extended form')
  if h=='y' 
    disp(rats(P))
   else 
    disp(P)
  end   
  disp('--------------------')  
  pause
 end

 if flag == 'T';
%select the inverse submatrix
  for rr=1:n,
   for ss=1:n,
    R(rr,ss)=P(rr,ss+n);
   end
  end
  disp('-inverse matrix-')
  if h=='y' 
    disp(rats(R))
   else 
    disp(R)
  end
 end 

 if flag == 'F';
  disp('-Inverse Does Not Exist-')
 end 
end

disp(' ')
format loose