function cn(P)
%CN	
%Condition number of matrix based on 1-norm. 
%       cond(A)= ||A||*||inv(A)||
%Also gives related concepts:
%inverse,determinant,1-norm of matrix,1-norm of inverse.
%Calling format: cn(A)

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

disp(' ')
format compact

if det(P)~=0
 original_matrix = P
 inverse=(inv(P));
 disp(' ')
 inverse_matrix =(inv(P))
 disp(' ')
 determinant_matrix = det(P)
 disp(' ')
 onenorm_matrix=norm(P,1)
 disp(' ')
 onenorm_invmatrix=norm(inverse,1)
 disp(' ')
 condition_number = onenorm_matrix*onenorm_invmatrix
else
 disp('determinant = 0')
 disp('inverse does not exist')
 disp('condition number undefined')
end

disp(' ')
format loose

