function X=cramer(A,B)
%CRAMER	
%Solution to system AX=B using Cramer's Rule.  
%Calling format: cramer(A,B)

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

format compact;
disp(' ')

if det(A)==0
   disp('det(matrix coeff)=0. Cramers Rule cannot be used.')
   disp(' ')
  else 
   g=input('All information? y/n: ','s');
   disp(' ')


  n=size(A);

  if g=='y'
    det_matrix_coeffs=det(A)
    disp(' ')
  end

  for variable=1:n
    if variable>=1
      Matrix=[A(1:n,1:variable-1) B A(1:n,variable+1:n)];
    end
    if g=='y'
      variable
      Matrix
      determinant=det(Matrix)
      disp(' ')
    end
    X(variable)=(det(Matrix))/(det(A));
  end

end





