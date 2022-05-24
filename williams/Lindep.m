function lindep(X,Y,Z)
%LINDEP 
%Check linear dependence/independence of 3 vectors.
%Calling format: lindep(X,Y,Z)

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

P=[X;Y;Z];
LI=isempty(X);  %initialize LI

%Gauss-Jordan Elimination 
%to find reduced echelon form of matrix P

tol=1e-20;
[n,m]=size(P);

%find a pivot
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
         for r=j:m,
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
      found=1;   % to exit while loop
     end
    end   %while
    if  j > m
     found = 0;
    end
   else
    found = 1;
  end

%normalize leading element in row changing the rest of the row accordingly
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

%end %end i loop

%Check to see if last row of P is nonzero vector
%If it is vectors are linearly independent
A=P(m,:);
for k=1:m
 if A(k)~=0 
  LI='true';
 end
end

disp(' ')
disp('Vectors')
disp(X)
disp(Y)
disp(Z)
if LI=='true';
  disp('are linearly independent')
 else
  disp('are linearly dependent')
end

disp(' ')

