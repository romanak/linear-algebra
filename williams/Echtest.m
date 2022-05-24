function echtest(m)
%ECHTEST 
%Experiment with random 3x3 matrices.
%See how many random 3x3 matrices
%with elements in interval [0, 10)
%have reduced forms which are not identity matrix.
%Calling format: echtest(m) where m is the desired # iterations. 

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

format compact
number=0;

disp(' ');
p=input('Integer matrix elements? y/n: ','s');
disp(' ');
q=input('Display reduced forms that are not I? y/n: ','s');
disp(' ')
disp('   - To Stop At Any Time -') 
disp('    command period (Mac)')
disp('       Ctrl C (IBM)')
disp(' ')
disp('- press enter to start iterations - ')
disp(' ')
pause

for n=1:m,  
  if 50*round(n/50)==n  %indication of how things are proceeding 
    n
  end
  B=10*rand(3);  %B, 3x3 matrix with 0<element<10
  if p=='y'
      M=floor(B);  %M, 3x3 matrix with integ elements
     else M=B; 
  end
  if det(M)==0  %then red ech form not identity
     number=number+1;
     disp('-------------------------')
     if q~='y'
         disp('Red Ech Form not Identity') 
         n
       else
         n
         M
         E=rref(M)		
     end
     disp('-------------------------')
   end
end

disp(' ')
disp('non-identity red ech forms')
number
disp(' ')
percentage=number/50
disp(' ')
