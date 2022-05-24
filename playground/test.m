n = 2000
A = rand(n,n);
tic
[L,U] = slu(A);
toc