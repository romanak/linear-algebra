% Linear ALgebra - Gilbert Strang C1.2E32

v = randn(3,1);
n = norm(v);
u = v/n;
V = randn(3,30);
U = normc(V);
s = 0;
for i=U
    s = s + abs(dot(i,u));
end
s = s/30