function simplex(P)
%SIMPLEX
%Simplex method.
%Option of rational number format. 
%Option of all steps.
%Calling format: simplex(A),
%where A is the initial simplex tableau.

%MATLAB computes to about 16 decimal digits

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

tol=1e-20;
[n,m]=size(P);
format compact

disp(' ')
h=input('Rational numbers? y/n: ','s');
g=input('All steps? y/n: ','s');

disp(' ')
disp('initial simplex tableau')
if h=='y' 
  disp(rats(P))
 else 
  disp(P)
end

disp(' ')

if g=='y';
 disp('[press Enter at each step to continue]')
 disp(' ')
 pause
end

flag='T';
while flag=='T'

%find pivot column
 t=0;
 for pc=1:m-1,
  if P(n,pc)-t<0
   t=P(n,pc);
   pivotcol=pc;
  end
 end

 if t==0; 
  flag='F';
 end

%find pivot
 if flag == 'T'
  tt=1E+100; %suitable large number 
  for pr=1:n-1,
   if P(pr,pivotcol)>0
    if P(pr,m)/P(pr,pivotcol)<tt
     tt=P(pr,m)/P(pr,pivotcol);
     pivotrow=pr;
    end
   end
  end
 end

%normalize leading element in row changing the rest of the row accordingly
 if flag=='T' 
  if (P(pivotrow, pivotcol) ~= 1) 
   if (abs(P(pivotrow, pivotcol)) > tol)
    y = P(pivotrow, pivotcol);
    for l=1:m,
     P(pivotrow, l) = P(pivotrow, l)/y ;
    end
    if g=='y'; %allsteps
     disp('normalize')
     if h=='y' 
       disp(rats(P))
      else 
       disp(P)
     end
     pause
     disp(' ')
    end %allsteps
   end
  end
  for r=1:n,
   if (abs(P(r, pivotcol)) >tol) 
    if (r ~= pivotrow)
     z=P(r, pivotcol);
     for c=1:m, 
      P(r, c)=P(r, c) - z * P(pivotrow, c);
     end
     if g=='y'; %allsteps
      disp('create zero')
      if h=='y' 
        disp(rats(P))
       else 
        disp(P)
      end
      pause
      disp(' ')
     end%end allsteps 
    end
   end
  end %end for r=1:n loop
 end %if flag'T'
end %while loop


%print out final matrix
disp('-final simplex tableau-')
if g~='y'
 if h=='y' 
   disp(rats(P))
  else 
   disp(P);
 end
end

disp(' ')
format loose

