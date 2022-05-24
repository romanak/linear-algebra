function lusolve(A,B)
%LUSOLVE
%LU decomposition of a matrix.
%Option of all steps. 
%Option to use factoriation to solve A*X = B for X.
%Calling format: lusolve(A,B)

% Copyright 1991 Lisa Coulter Stetson University.
% email: lcoulter@stetson.edu
% Accompanies "Linear Algebra with Applications" by Gareth Williams

disp(' ');
disp('Routine to solve the system AX = B using LU factorization');
[n,m] = size(A);
g=input('All steps? y/n: ','s');
disp(' ');
disp( 'initial matrix: ');
disp(A);
if g=='y'; %All steps option.
    disp('[press return at each step to continue]')
    disp(' ') 
    pause
end
if g == 'n';
    disp('**computing**');
end
tol = 1.0e-20;
flag = 1;

u = zeros(n,m);
l = eye(n,m);
for i = 1:n
    u(1,i) = A(1,i);
end
if g=='y'; %All steps option.
	   disp( 'first row of U = first row of A ');
    disp(u); 
    pause;
end
for i = 1:n
   if (abs(A(i,i)) < tol)
          disp('zero on diagonal of A ');
          disp('LU factorization not possible ');
          flag = 0;
          break;
    end
    for j = i+1:n
        m = A(j,i)/A(i,i);
        l(j,i) = m;
								if g == 'y'; %All steps option.
            disp('determining multipliers to be put into L ');
	           disp('new L: ');
            disp(l);
            pause;
        end
        for k = 1:n
            A(j,k) = A(j,k) - m*A(i,k);
            u(j,k) = A(j,k);
        end
        if g == 'y'; %All steps option.
           disp('creating zero');
           disp('new U:');
           disp(u);
           pause;
        end
    end
end
if (flag == 1)
    disp(' ');
    disp('final L matrix: ');
    disp(l);
    disp('final U matrix: ');
    disp(u);
    if (g == 'n'); %All steps not requested.
								disp('[press return to continue]');
        disp('');
        pause;
        disp('solving AX = LUX = B: ');
        disp('B:');
        disp(B);
				    x = inv(l)*B;
        x = inv(u)*x;
        disp('solution: ');
        disp(x);
     end;
				if (g == 'y'); %All steps option.
        pause;
				    disp('solving AX = LUX = B: ');
        disp('B:'); 
        disp(B);
				    pause;
        disp('computing C = inv(L)*B');
				    x = inv(l)*B;
        disp(x);
        pause;
        disp('computing X = inv(U)*C');
        x = inv(u)*x;
        disp('solution: ');
        disp(x);
    end
end
if (flag == 0)
    disp('L at time of abort: ');
    disp(l);
    disp('U at time of abort: ');
    disp(u);
    disp('matrix A: ');
    disp(A);
end
