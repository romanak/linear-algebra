function gseidel(A)
%GSEIDEL 
%Gauss-Seidel iteration. 
%System of n equations in n variables.
%Augmented matrix A is nx(n+1).
%Calling format: gseidel(A)

% Copyright 1991 Lisa Coulter. Stetson University.
% email: lcoulter@stetson.edu
% Accompanies "Linear Algebra with Applications" by Gareth Williams

format compact
disp(' ')
disp('Gauss - Seidel iteration')
[n,m] = size(A);
nmax = input('Number of iterations: ');
tol = input('Tolerance: ');
x = input('Initial estimate: ');
xo = x';
g=input('All steps? y/n: ','s');
disp(' ')
disp('initial matrix')
disp(A)
if g=='y'; %All steps option.
    disp('[press return at each step to continue]')
    pause
  else
   disp(' ')
   disp('**computing**')
end

k = 1;
while k <= nmax
    for i = 1:n
        sum = 0.0;
        for j = 1:i-1
            sum = sum + A(i,j)*x(j);
        end
        for j = i+1:n
            sum = sum + A(i,j)*xo(j);
        end
        x(i) = A(i,n+1) - sum;
        x(i) = x(i)/A(i,i);
    end
    if g=='y' %All steps option.
        disp(' ')
        disp('iteration')
        disp(k)
        disp('X =')
        disp(x')
        pause
    end

%Check if within tolerance of solution. Use 1-norm.
    sumx = 0;
    sumxo = 0;
    for i = 1:n
	sumx = sumx + x(i);
	sumxo = sumxo + xo(i);
    end
    if abs(sumx - sumxo) < tol %If within tolerance, stop program.
        disp(' ')
        disp('Successful run')
        disp('Number of iterations')
	       disp(k)
        disp('Solution')
        break
    end
    k = k+1;
    for i = 1:n
        xo(i) = x(i);
    end
end

%Run has been unsuccessful; tolerance not achieved after namx iterations.
if (k > nmax)
    disp(' ')
    disp('Desired tolerance not achieved')
    disp('Value of X at end of run:')
end
disp(x')
