function pivot(A)
%PIVOT 
%Complete pivotting for system of linear equations.
%Allstep option. 
%Calling format: pivot(A)

%Copyright 1991. Lisa Coulter. Stetson University.
%email: lcoulter@stetson.edu

tol = 1.0e-20;
disp(' ');
disp('Total Pivotting')
[n,m] = size(A);
g=input('All steps? y/n: ','s');
disp(' ')
disp('initial matrix')
disp(A)

if g=='y'; %All steps option.
			disp('[press return at each step to continue]')
 		disp(' ')
 		pause
end
if g == 'n';
   disp(' **computing** ');
   disp(' ');
end
%Initialize vector to keep track of column swaps.
for i = 1:n
    col(i) = i;
end

%Do elimination.
for k = 1:n-1
    max = 0;
    isav = k;
    jsav = k;
    for i = k:n  % Find pivot.
        for j=k:n
            mtest = A(i,j);
            if (abs(mtest)) > max 
              max = abs(A(i,j));
              isav = i;
              jsav = j;
            end
        end
    end
    if( max < tol) %Check if no pivot has been found.
        disp('matrix is singular');
        disp(A);
        break;
    end
    if (isav ~= k)
        %switch rows.
        for j = 1:m
            temp = A(k,j);
            temp1 = A(isav,j);
            A(k,j) = temp1;
            A(isav,j) = temp;
        end 
        if g=='y' %All steps option.
            disp('swap rows');
            disp(A);
            pause;
        end
    end
    if (jsav ~= k)
        %switch columns.
        tempcol = col(jsav);
        col(jsav) = col(k);
        col(k) = tempcol;
        for i=1:n
            temp = A(i,k);
            temp1 = A(i,jsav);
            A(i,jsav) = temp;
            A(i,k) = temp1;
        end
        if g=='y' % All steps option.
            disp('swap columns');
            disp(A);
            disp('variables now in order: ');
            disp(col');
            pause;
        end
    end
    for j = k+1:n %Create zeros below pivot.
        mult(j,k) = A(j,k)/A(k,k);
        for i = 1:m
            A(j,i) = A(j,i) - mult(j,k)*A(k,i);
        end
        if g=='y' %All steps option.
            disp('create zero');
            disp(A)
            pause;
       end
    end
end
%End of elimination.
if (A(n,n) == 0) %Check for singular matrix.
    disp('matrix of coefficients is singular')
    disp(A);
    break;
end

%Do back substitution.
for k = 1:m-n
    x(k,n) = A(n,n+k)/A(n,n);
end
for k = 1:m-n
    for i = n-1:-1:1
        sum(k) = 0;
        for j = i+1:n
            sum(k) = sum(k) + A(i,j)*x(k,j);
        end
        x(k,i) = A(i,n+k) - sum(k);
        if (A(i,i) == 0) %Check for singular matrix.
            disp('matrix of coefficients is singular');
            disp(A);
            break;
        end
        x(k,i) = x(k,i)/A(i,i);
    end
end

%Display upper triangular form.
disp('upper triangular form:');
disp(A);

%Swap solution vector if columns have been exchanged.
if g == 'y'%All steps option.
    for i = 1:n
        if(col(i) ~= i)
          disp('current order of variables: ');
          disp(col');
          pause;
          disp('switching back to original order ');
          disp(' ');
          break;
        end
    end
end

for j = 1:m-n 
    for i = 1:n
        xo(j,col(i)) = x(j,i);
    end
end

%Display solution.
disp('solution:');
disp(xo');



