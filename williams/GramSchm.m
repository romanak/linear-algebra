function GramSchm
%Gram-Schmidt Orthogonalization.
%Calling format: GramSchm

% Copyright 1991 Lisa Coulter. Stetson University.
% email: lcoulter@bliss.stetson.edu
% Accompanies "Linear Algebra with Applications" by Gareth Williams
disp(' '); 
disp('Gram-Schmidt Orthogonalization');

m = input('Number of vectors to be orthonormalized: ');
n = input('Number of elements in each vector: ');
disp(' ');
v = zeros(n,m);
temp = zeros(1,n);
fprintf('You will now be prompted to enter each vector.\n');
for i = 1:m   
    fprintf(' Enter vector%2.0f:',i);
    fprintf('\n');
	for j = 1:n
		a = input('Enter element: ');
    		temp(1,j) = a;
	end
    temp1 = temp';
	for j = 1:n
    		v(j,i) = temp1(j,1);
	end
end

g=input('All steps? y/n: ','s');
if g=='y'; %All steps option.
    disp('[press return at each step to continue]')
    disp(' ') 
    pause
end
if g == 'n' %All steps not selected.
   disp(' ');
   disp('**Computing**');
   disp(' ');
end
tol = 1e-20;
flag = 1; %Keeps track of linear dependence.
flag1 = 1;
if g=='y'; %All steps option.
	   disp(' Initial vectors: ');
	  for i=1:m
        fprintf('Vector%2.0f\n ',i)
        disp(v(:,i)');
   end
   pause
end
temp = zeros(n,m);
u = v;
if g=='y'; %All steps option.
   disp('Perform orthogonalization ');
   disp('');
end
for i = 1:m
    if g=='y'; %All steps option.
       fprintf('Orthogonalizing vector%2.0f\n',i);
    end
    temp = zeros(n,m);
    for k = 1:i - 1
        normu = u(:,k)'*u(:,k);
        if (normu >= tol) %Be careful not to divide by a 0 norm.
            normu = 1.0/normu;
            temp(:,i) = temp(:,i) + normu*u(:,k)'*v(:,i)*u(:,k);
        end
    end
    u(:,i) = v(:,i) - temp(:,i);
    normu = u(:,i)'*u(:,i);
    if (normu < tol) 
        flag = 0; %Indication that vectors are linearly independent.
        flag1 = 0; %Indication that vectors are linearly independent.
        u(:,i) = zeros(n,1); %Prevents rounding errors.
        if (g == 'y') %All steps option.
            fprintf('Vector%2.0f is linearly dependent\n',i);
            disp('');           
            pause;        
        end
    end
    if (flag ~= 0)
        if g=='y'; %All steps option.
            disp('Orthogonal basis vector');
            disp(u(:,i)');
            pause;
       end
    end
    if (flag == 0)
       flag = 1; %Allows for independent vectors to follow dependent vectors.
    end
end
if g=='y'; %All steps option.
   disp('Normalizing vectors ');
   disp('');
end
for i = 1:m
    normu = u(:,i)'*u(:,i);
    if (normu >= tol)
        normu = sqrt(normu);
        u(:,i) = (1.0/normu)*u(:,i);
    end
    if (normu < tol) %Vectors are linearly dependent.
        flag = 0;
        flag1 = 0;
    end
    if g=='y'; %All steps option.
        if (normu >= tol)
            fprintf('Normalize vector%2.0f\n ',i);
            disp(u(:,i)');
            pause;
        end
    end
end
if (flag1 ~= 0)
    disp('Orthonormal basis ');
    disp(u');
end
if (flag1 == 0)
    disp('Orthonormal basis of proper subspace ');
    disp(' ');
    for i = 1:m
        normu = u(:,i)'*u(:,i);
        if (normu >= tol)
            disp(u(:,i)');
        end
    end
end
