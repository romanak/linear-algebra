function leoinv(P)
%LEOINV	
%Computes inverse of (I-A) in Leontief Model.
%Uses iterations,inv(I-A)=I+A+A^2+A^3...
%Displays an "Identity test": (I-A)*inv(I-A)
%Section 2.5 LAWA.
%Calling format: leoinv(A)

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

format compact
[n,m]=size(P);
approx=eye(n);
next=eye(n);
g='y';i=1;

disp(' ')
disp('I-A=')
disp(eye(n)-P)

disp(' ')
h=input('All steps? y/n: ','s');

if h=='y' 
  while g=='y'
   disp(' ')
   iteration = i
   disp(' ')
   Approx_inv =approx
   disp(' ')
   Identity_test=(eye(n)-P)*approx
   disp(' ')
   g=input('continue y/n: ','s');
   disp('--------------------')
   next=next*P;
   approx=approx+next;
   i=i+1;
  end  %end while

 else
  k=input('Give number of iterations: ');
  if k==1;
    disp(' ')
    iterations=1
    Leontief_inverse=eye(n)
   else
    for j=1:k-1
     next=next*P;
     approx=approx+next;
    end  
    disp(' ')
    iterations=k
    disp(' ')
    Approx_inv=approx 
    disp(' ')
    Identity_test=(eye(n)-P)*approx
    disp(' ')
  end
end 

disp(' ')
format loose





