% Linear ALgebra - Gilbert Strang C2.2E29
A = [;;];
for i=1:100000
    [L,U]=lu(rand(3));
    v = [U(1,1); U(2,2); U(3,3)];
    A = [A v];
end
M = mean(A,2)