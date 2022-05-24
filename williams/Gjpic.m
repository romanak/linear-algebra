function gjpic(P)
%GJPIC
%Graphs lines in Gauss-Jordan elimination.
%Systems in two variables. Matrix A has three columns.
%Calling format: gjpic(A), where A is augmented matrix.

%Can use given tolerance of 1e-14
%or change to own tolerance
%MATLAB computes to about 16 decimal digits

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

tol=1e-14;
y=0; %initial value of y
[n,m]=size(P);
w=1; %window1
change='f';
format compact

disp(' ')
disp(P)
disp('--------------------')

clf %clear graphics window
figure(gcf)
pic(P,w) %graph the lines of P

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
         for r=1:m,
          temp=P(i, r);
          P(i, r)=P(s, r);
          P(s, r) = temp;
         end
         disp(P)
         disp('--------------------')
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
     disp(P)
     disp('--------------------')
    end
   end

   for r=1:n,
    if (abs(P(r, j)) >tol) 
     if (r ~= i)
      z=P(r, j);
      for c=j:m, 
       P(r, c)=P(r, c) - z * P(i, c);
       change='t';
      end
     end
    end
   end

   if change=='t'
    disp(P)
    disp('--------------------')
    w=w+1;
    pic(P,w)
    change='f';
   end

   j = j + 1;

  end
 end
%end i loop
end

disp('    -reduced echelon form-')
disp(' ')
format loose

